<template>
  <div class="footer bg-dark text-white py-4">
    <h4 class="text-center">&copy; {{ date }} Codebook Inc.</h4>
  </div>
</template>

<script>
export default {
  name: "Footer",
  computed: {
    date() {
      let date = new Date();
      return date.getFullYear();
    },
  },
};
</script>
