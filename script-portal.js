const passInput = document.querySelector('#password');
const toggleBtn = document.querySelector('#togglePassword');


//Show Password Function
let showPass = () => {
    const type = passInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passInput.setAttribute('type', type)
    this.classList.toggle('fa-eye-slash');
}

toggleBtn.addEventListener('click', showPass);
//--

