import { initViewer, listModels, loadModel } from './utils.js';

const viewer = await initViewer(document.getElementById('viewer'), { extensions: ['Autodesk.DocumentBrowser'] });
const models = await listModels();
const dropdown = document.getElementById('models');
dropdown.innerHTML = models.map(m => `<option value="${m.urn}">${m.name}</option>`).join('');
dropdown.onchange = () => dropdown.value && loadModel(viewer, dropdown.value);
dropdown.onchange();
