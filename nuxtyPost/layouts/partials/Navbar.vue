<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="purple">
      <b-navbar-brand href="/">NuxtyPosts</b-navbar-brand>

      <b-navbar-toggle target="nav-collapse" />

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav class="ml-auto">
          <li class="nav-item">
            <NuxtLink class="nav-link" to="/">Home</NuxtLink>
          </li>
          <li class="nav-item">
            <NuxtLink class="nav-link" to="/about">About</NuxtLink>
          </li>
          <li class="nav-item">
            <NuxtLink class="nav-link" to="/contact">Contact</NuxtLink>
          </li>
          <b-nav-item-dropdown text="Account" right v-if="isAuth">
            <NuxtLink class="dropdown-item" to="/user/profile">
              Profile
            </NuxtLink>
            <NuxtLink class="dropdown-item" to="/user/logout">
              Logout
            </NuxtLink>
          </b-nav-item-dropdown>
          <b-nav-item-dropdown text="Authenticate" right v-else>
            <NuxtLink class="dropdown-item" to="/auth/login"> Login </NuxtLink>
            <NuxtLink class="dropdown-item" to="/auth/register">
              Register
            </NuxtLink>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>
export default {
  name: "Navbar",
  computed: {
    isAuth() {
      return false;
    },
  },
};
</script>
