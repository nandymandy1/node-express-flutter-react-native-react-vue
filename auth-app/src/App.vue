<template>
  <div id="app" class="bg-light d-flex flex-column">
    <Navbar />
    <div class="container mt-5">
      <RouterView />
    </div>
  </div>
</template>

<script lang="ts">
import Navbar from "@/Utils/Navbar.vue";
import { Options, Vue } from "vue-class-component";
@Options({
  name: "Main",
  components: {
    Navbar,
  },
})
export default class Main extends Vue {}
</script>
