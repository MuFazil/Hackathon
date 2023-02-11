<script>
import { RouterLink } from "vue-router";
</script>

<template>
  <div class="bg"></div>
  <div class="signup">
    <div class="formgroup">
      <h2>Register</h2>
      <input type="text" placeholder="Full Name" />
      <input type="text" placeholder="Email" />
      <input type="text" placeholder="Password" />
      <input type="text" placeholder="Repeat Password" />
      <button>Sign Up <i class="fa-solid fa-right-to-bracket"></i></button>
      <p>Already have an account? <RouterLink to="/">Sign In</RouterLink></p>
    </div>
  </div>
</template>

<style scoped>
a {
  color: brown;
}
p {
  color: white;
  text-align: center;
}
h2 {
  font-family: sans-serif;
  color: white;
  text-align: center;
  margin-bottom: 30px;
}
.formgroup {
  display: flex;
  margin: 10px;
  flex-direction: column;
}
input {
  margin-top: 10px;
  margin-bottom: 10px;
  height: 35px;
  border-radius: 7px;
  border: none;
  text-align: center;
}
button {
  margin-top: 10px;
  margin-bottom: 10px;
  height: 35px;
  border-radius: 7px;
  border: none;
  font-size: 17px;
  color: white;
  background-color: rgba(44, 11, 18, 0.76);
}
</style>
