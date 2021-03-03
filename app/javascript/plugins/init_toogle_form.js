const initToogleForm = () => {
  const btn = document.getElementById("btn-review");
  if (btn) {
    btn.addEventListener('click', () => {
      const form = document.getElementById("form-review");
      form.classList.remove("d-none")
      btn.classList.add("d-none")
    })
  };
}

export { initToogleForm }
