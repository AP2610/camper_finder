const loadFile = (event) => {
  const output = document.getElementById('output');
  if (output) {
    output.src = URL.createObjectURL(event.target.files[0]);
  }
};

export { loadFile };
