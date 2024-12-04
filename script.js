document.addEventListener('DOMContentLoaded', () => {
    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Button interaction on homepage
    const donateButton = document.querySelector('.banner button');
    donateButton.addEventListener('click', function () {
        this.textContent = 'Thank you for your support!';
        this.disabled = true;
        setTimeout(() => {
            this.textContent = 'Start with a little effort';
            this.disabled = false;
        }, 3000);
    });

    // Form validation (assumes form elements exist)
    const signupForm = document.getElementById('signupForm');
    if (signupForm) {
        signupForm.addEventListener('submit', event => {
            event.preventDefault();
            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value.trim();
            const confirmPassword = document.getElementById('confirmPassword').value.trim();
            const errorMessage = document.getElementById('errorMessage');

            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!emailPattern.test(email)) {
                errorMessage.textContent = 'Invalid email address';
                errorMessage.style.display = 'block';
                return;
            }

            if (password !== confirmPassword) {
                errorMessage.textContent = 'Passwords do not match';
                errorMessage.style.display = 'block';
                return;
            }

            if (password.length < 6) {
                errorMessage.textContent = 'Password must be at least 6 characters';
                errorMessage.style.display = 'block';
                return;
            }

            alert('Sign-up successful!');
            signupForm.reset();
        });
    }
});
