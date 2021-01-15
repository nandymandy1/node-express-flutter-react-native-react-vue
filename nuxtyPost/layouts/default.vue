<template>
  <div
    :style="{ minHeight: '100vh' }"
    class="d-flex flex-column justify-content-between"
  >
    <Navbar />
    <div class="container flex-grow-1 py-5">
      <Nuxt />
    </div>
    <Footer />
  </div>
</template>
<script>
import "../assets/scss/main.scss";
import Navbar from "./partials/Navbar";
import Footer from "./partials/Footer";
export default {
  components: { Navbar, Footer },
};
</script>
