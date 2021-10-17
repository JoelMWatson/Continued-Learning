const getDamage = (min, max) => {
  // calc random number between min and max
  return Math.floor(Math.random() * (max - min)) + min;
}

const app = Vue.createApp({
  data() {
    return {
      playerHealth: 100,
      monsterHealth: 100
    }
  },
  methods: {
    playerAttack() {
      const damage = getDamage(5, 12);
      this.monsterHealth -= damage;
      this.monsterAttack();
    },
    monsterAttack() {
      const damage = getDamage(8, 15);
      this.playerHealth -= damage;
    }
  }
})

app.mount('#game');