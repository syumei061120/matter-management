if (document.URL.match(/search/)) {
  document.addEventListener('DOMContentLoaded', () => {
  const searchAccordionButton = document.querySelectorAll('.search-accordion-button');

    for (let i = 0; i < searchAccordionButton.length; i++) {
      if(searchAccordionButton[i].classList.contains('is-opened')) {
        searchAccordionButton[i].nextElementSibling.style.height = searchAccordionButton[i].nextElementSibling.scrollHeight + 'px';
      }
        searchAccordionButton[i].addEventListener('click', (e) => {
        let currentElement = e.currentTarget;
        let accordionTarget = currentElement.nextElementSibling;

        if (accordionTarget.style.height) {
          currentElement.classList.remove('is-opened');
          accordionTarget.style.height = null;
          } else {
          currentElement.classList.add('is-opened');
          accordionTarget.style.height = accordionTarget.scrollHeight + 'px';
        }
      });
    }
  });
}