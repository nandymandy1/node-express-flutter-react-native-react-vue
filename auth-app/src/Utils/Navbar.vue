<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand text-success font-weight-bold" href="/">
        <img src="@/assets/logo.png" class="img-fluid brand-logo" alt="brand-logo">
      </a>
      <button
        type="button"
        aria-expanded="false"
        class="navbar-toggler"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon" />
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mb-2 mb-lg-0 d-flex">
          <li class="nav-item">
            <RouterLink class="nav-link" to="/">Home</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/about">About</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/auth/login">Login</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/auth/register">
              Register
            </RouterLink>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script lang="ts">
import { Vue } from "vue-class-component";
export default class Navbar extends Vue {}
</script>