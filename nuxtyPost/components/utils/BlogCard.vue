<template>
  <div class="profile-card">
    <div class="profile-card-2">
      <img
        class="img img-responsive"
        src="http://envato.jayasankarkr.in/code/profile/assets/img/profile-2.jpg"
      />
      <div class="profile-name">JOHN DOE</div>
      <div class="profile-username">@johndoesurname</div>
      <div class="profile-icons">
        <a href="#">
          <i class="fa fa-facebook" />
        </a>
        <a href="#">
          <i class="fa fa-twitter" />
        </a>
        <a href="#">
          <i class="fa fa-linkedin" />
        </a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ProfileCard",
  props: {
    name: {
      type: String,
      required: true,
    },
    profileImage: {
      type: String,
      required: true,
    },
    profileUsername: {
      type: String,
      required: true,
    },
  },
};
</script>
