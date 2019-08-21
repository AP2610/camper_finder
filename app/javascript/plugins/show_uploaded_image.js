const loadFile = (event) => {
  const output = document.getElementById('output');
  output.src = URL.createObjectURL(event.target.files[0]);
};

export { loadFile };
