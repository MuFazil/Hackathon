<script>
import axios from "axios";
export default {
  data() {
    return {
      email: undefined,
      password: undefined,
    };
  },
  methods: {
    async signin() {
      let result = await axios.post(
        "https://VashistHackathon.mufazil.repl.co/signin",
        {
          email: this.email,
          password: this.password,
        }
      );
      console.log(result);
      if (result.data.admin === true) {
        window.location.href = "/dashboard";
        console.log("Organizer");
      } else {
        // this.$route.to("/dashboard");
        console.log("Normal User");
      }
    },
  },
};
</script>

<template>
  <div class="bg"></div>
  <div class="signin">
    <div class="formgroup">
      <h2>Sign In</h2>
      <input v-model="email" type="text" placeholder="Email" />
      <input v-model="password" type="password" placeholder="Password" />
      <button @click="signin">
        Sign In <i class="fa-solid fa-right-to-bracket"></i>
      </button>
      <p>
        Don't have an account? <RouterLink to="/register">Sign up</RouterLink>
      </p>
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
