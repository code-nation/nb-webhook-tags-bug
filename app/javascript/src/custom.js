document.addEventListener("turbo:load", () => {
  const link = document.querySelector("#show_form a");
  if (link) {
    link.addEventListener("click", function(e){
      e.preventDefault();
      this.closest("p").style.display = "none";
      document.getElementById("update_person_tags_form").style.display = "block";
    });
  }
});
