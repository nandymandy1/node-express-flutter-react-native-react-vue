<template>
  <div class="auth-register">
    <div class="row">
      <div class="col-md-6 col-sm-12 mx-auto">
        <div class="card">
          <div class="card-body py-3">
            <h1 class="card-title display-4">Register</h1>
            <div class="form-group">
              <label for="username" class="font-weight-bold text-primary">
                Username
              </label>
              <input
                type="text"
                id="username"
                name="username"
                v-model="username"
                class="form-control"
                placeholder="Username"
              />
            </div>
            <div class="form-group mt-3">
              <label for="password" class="font-weight-bold text-primary">
                Password
              </label>
              <input
                id="password"
                type="password"
                name="password"
                v-model="password"
                class="form-control"
                placeholder="Password"
              />
            </div>
            <div class="form-group mt-3">
              <label for="email" class="font-weight-bold text-primary">
                Email
              </label>
              <input
                id="email"
                type="email"
                name="email"
                v-model="email"
                class="form-control"
                placeholder="Email"
              />
            </div>
            <div class="form-group mt-3 mb-3">
              <button class="btn btn-primary btn-lg" @click="registerUser">
                Register
              </button>
              &nbsp;&nbsp;
              <RouterLink class="btn btn-light btn-lg" to="/auth/login">
                Login
              </RouterLink>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from "vue";
export default defineComponent({
  name: "app-login",
  setup() {
    const username = ref("");
    const password = ref("");
    const email = ref("");

    const registerUser = () => {
      console.log(username.value);
      console.log(password.value);
      console.log(email.value);
    };

    return {
      email,
      username,
      password,
      registerUser,
    };
  },
});
</script>