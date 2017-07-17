%% Resource File

currentPath = fileparts(mfilename('fullpath'));
saveLocation = fullfile(currentPath, '../resources/');

docNode = com.mathworks.xml.XMLUtils.createDocument('RCC');
docRoot = docNode.getDocumentElement();

%
currentNode = docNode.createElement('qresource');
currentNode.setAttribute('prefix', '/images');
currentNode.appendChild(fileToXML(docNode, 'file', 'repeating-brains.png',  'images/repeating-brains.png'));
currentNode.appendChild(fileToXML(docNode, 'file', 'eye.png',               'images/eye.png'));
currentNode.appendChild(fileToXML(docNode, 'file', 'eye-hidden.png',        'images/eye-hidden.png'));
currentNode.appendChild(fileToXML(docNode, 'file', 'eye-hover.png',         'images/eye-hover.png'));
currentNode.appendChild(fileToXML(docNode, 'file', 'eye-hidden-hover.png',  'images/eye-hidden-hover.png'));
currentNode.appendChild(fileToXML(docNode, 'file', 'iterate.png',           'images/iterate.png'));
currentNode.appendChild(fileToXML(docNode, 'file', 'iterate-off.png',       'images/iterate-off.png'));
currentNode.appendChild(fileToXML(docNode, 'file', 'iterate-hover.png',     'images/iterate-hover.png'));
currentNode.appendChild(fileToXML(docNode, 'file', 'iterate-off-hover.png', 'images/iterate-off-hover.png'));
docRoot.appendChild(currentNode);

%
currentNode = docNode.createElement('qresource');
currentNode.setAttribute('prefix', '/qss');
currentNode.appendChild(fileToXML(docNode, 'file', 'visibility_button.qss', 'qss/visibility_button.qss'));
currentNode.appendChild(fileToXML(docNode, 'file', 'iterator_button.qss',   'qss/iterator_button.qss'));
currentNode.appendChild(fileToXML(docNode, 'file', 'remove_button.qss',     'qss/remove_button.qss'));
currentNode.appendChild(fileToXML(docNode, 'file', 'expand_button.qss',     'qss/expand_button.qss'));
currentNode.appendChild(fileToXML(docNode, 'file', 'port.qss',              'qss/port.qss'));
currentNode.appendChild(fileToXML(docNode, 'file', 'nodeLabel.qss',         'qss/nodeLabel.qss'));

docRoot.appendChild(currentNode);

%% Add NiPype nodes
prefix = 'dictionaries/NiPype';
directory = fullfile('../resources', prefix);
currentNode = docNode.createElement('qresource');
currentNode.setAttribute('prefix', prefix);

files = dir([directory '/*.JSON']);
files = {files(:).name};

for i = 1:length(files)
    fileNode = docNode.createElement('file');
    fileNode.setAttribute('alias', sprintf('dict_%03d.json', i - 1));
    [~, file, ~] = fileparts(files{i});
    currentNode.appendChild(fileToXML(docNode, 'file', sprintf('dict_%03d.JSON', i - 1),   strrep(fullfile(directory, [file, '.JSON']), '\', '/')));
end
docRoot.appendChild(currentNode);

%% Add TvM nodes
prefix = 'dictionaries/TvM';
directory = fullfile('../resources', prefix);
currentNode = docNode.createElement('qresource');
currentNode.setAttribute('prefix', prefix);
currentNode.appendChild(fileToXML(docNode, 'file', 'dict_000.JSON',   strrep(fullfile(directory, 'tvm.JSON'), '\', '/')));
docRoot.appendChild(currentNode);

%%
xmlFileName = fullfile(saveLocation, 'resources.qrc');
xmlwrite(xmlFileName, docNode);
type(xmlFileName);














