import { html, render } from 'https://esm.sh/htm/preact/standalone';

// Load Monaco Editor dynamically
let monacoLoaded = false;
let monacoPromise = null;

async function loadMonaco() {
  if (monacoLoaded) {
    return window.monaco;
  }
  
  if (monacoPromise) {
    return monacoPromise;
  }
  
  monacoPromise = (async () => {
    const { monaco, loadCss } = await import('https://esm.sh/monaco-esm');
    loadCss();
    window.monaco = monaco;
    monacoLoaded = true;
    return monaco;
  })();
  
  return monacoPromise;
}

MiniJS.register('code-editor', {
  init() {
    this.state.code = '// Welcome to Monaco Editor\nconsole.log("Hello, world!");';
    this.state.language = 'javascript';
    this.editor = null;
    this.monacoInitialized = false;
    this.containerId = `monaco-editor-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
    
    this.paint();
  },
  
  async initMonaco() {
    if (this.monacoInitialized) return;
    
    const container = this.querySelector(`#${this.containerId}`);
    if (!container) {
      setTimeout(() => this.initMonaco(), 100);
      return;
    }
    
    try {
      const monaco = await loadMonaco();
      
      if (this.editor) {
        this.editor.dispose();
      }
      
      this.editor = monaco.editor.create(container, {
        value: this.state.code,
        language: this.state.language,
        theme: 'vs-dark',
        automaticLayout: true,
        minimap: { enabled: true },
        fontSize: 14,
        lineNumbers: 'on',
        roundedSelection: false,
        scrollBeyondLastLine: false,
        readOnly: false,
        cursorStyle: 'line'
      });
      
      // Listen for changes
      this.editor.onDidChangeModelContent(() => {
        this.state.code = this.editor.getValue();
      });
      
      this.monacoInitialized = true;
    } catch (error) {
      console.error('Error initializing Monaco editor:', error);
    }
  },
  
  changeLanguage(language) {
    this.state.language = language;
    if (this.editor && window.monaco) {
      window.monaco.editor.setModelLanguage(this.editor.getModel(), language);
    }
    this.paint();
  },
  
  setCode(code) {
    this.state.code = code;
    if (this.editor) {
      this.editor.setValue(code);
    }
    this.paint();
  },
  
  destroy() {
    if (this.editor) {
      this.editor.dispose();
      this.editor = null;
      this.monacoInitialized = false;
    }
  },
  
  paint() {
    const CodeEditorComponent = () => html`
      <div class="mb-4">
        <label class="block text-sm font-semibold mb-2">Language:</label>
        <select
          class="ui-input"
          value=${this.state.language}
          onChange=${(e) => {
            this.changeLanguage(e.target.value);
          }}
        >
          <option value="javascript">JavaScript</option>
          <option value="typescript">TypeScript</option>
          <option value="html">HTML</option>
          <option value="css">CSS</option>
          <option value="json">JSON</option>
          <option value="python">Python</option>
          <option value="ruby">Ruby</option>
          <option value="markdown">Markdown</option>
        </select>
      </div>
      
      <div
        id=${this.containerId}
        style="width: 100%; height: 600px; border: 1px solid var(--ui-color-border); border-radius: 0.5rem;"
      ></div>
    `;
    
    render(CodeEditorComponent(), this);
    
    // Initialize Monaco after render
    setTimeout(() => {
      this.initMonaco();
    }, 0);
  }
});

