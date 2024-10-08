
# **Roblox DDTANK-Inspired Game**

This project is a 3D game inspired by the mechanics and gameplay of DDTANK, built using Roblox Studio. It features player stats, equipment, PvE combat, an inventory system, and more. The game allows players to equip weapons and shields, engage in battles with monsters, and manage their attributes through an RPG-style system.

## **Features**

### 1. **Player Stats System**
   - **Attributes**: 
     - **Attack**: Increases the damage dealt in combat.
     - **Defense**: Reduces damage taken.
     - **Agility**: Increases attack speed and physical force (energy), and determines combat order.
     - **Luck**: Increases the chance to hit critical attacks and reduces enemy defense on critical hits.
     - **Damage**: The base damage a player can deal.
     - **Protection**: Reduces the damage received during combat.
     - **Physical Force**: Energy consumed when moving or using items.
     - **Health**: Total health points; when it reaches zero, the player becomes a ghost.

### 2. **Inventory and Equipment System**
   - Players can collect, equip, and manage items such as weapons and shields.
   - Equipped items affect the player's stats and are visually represented on the player avatar.
   - Example items: 
     - **Bronze Sword**: Increases attack.
     - **Iron Shield**: Increases defense.

### 3. **Coin System**
   - Players can earn and spend coins in the game.
   - Coins are displayed in the HUD and are rewarded for completing missions or defeating monsters.
   - Players can use coins to buy items in the store.

### 4. **PvE Combat System**
   - Players can fight against monsters with unique health, attack, and defense stats.
   - Combat involves calculating damage based on the player's attack and the monster's defense, and vice versa.
   - Players are rewarded with coins and items for defeating monsters.

## **Current Project Structure**

### **playerStats.lua** (StarterPlayerScripts)
Manages player attributes and displays them in the HUD. Contains functions to update and modify stats based on equipped items and combat.

### **inventory.lua** (StarterGui)
Handles the player's inventory system, allowing players to equip items. Also manages the visual representation of items on the player avatar.

### **coins.lua** (StarterPlayerScripts)
Manages the player's coin balance. Includes functions to add or remove coins and display the balance in the HUD.

### **combat.lua** (StarterPlayerScripts)
Handles the combat system, calculating damage between the player and monsters. Includes functionality for counterattacks from monsters and rewards players with coins upon defeating enemies.

## **Planned Features**

### 1. **Player vs Player (PvP) Combat**
   - Implement player-to-player battles, balancing stats between opponents and adding a leaderboard system.

### 2. **Guild System**
   - Allow players to form and join guilds.
   - Introduce guild-based events and leaderboards.

### 3. **Mission System**
   - Add quests for players to complete in exchange for rewards like coins, experience, or items.

### 4. **Buffs and Debuffs**
   - Introduce temporary stat changes, allowing players to gain buffs during certain situations or apply debuffs to enemies.

### 5. **Expanded Combat and Monster Variety**
   - Add more types of monsters with unique abilities and stats.
   - Introduce new player skills and abilities to diversify combat strategies.

## **How to Contribute**

1. **Fork the repository** and clone it locally.
2. Make changes or improvements to the game logic.
3. Submit a **pull request** with a description of your changes.

## **Requirements**

- **Roblox Studio**: You need Roblox Studio to edit, test, and run the game code.
- **Git**: For version control and collaboration.

## **Getting Started**

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ddtank-roblox.git
   ```

2. Open the project in **Roblox Studio**.
3. Open the scripts located in **StarterPlayerScripts** and **StarterGui** to explore the game's logic.
4. Test the game locally in Roblox Studio to see the changes in action.

---

## **Contributors**

- **Luiz Felippe S. A. Fonseca** - Lead Developer and Project Creator.
- **Lucca De Alencar Santini** - Database Administrator.
- **Vicente** - ele ta ai

---

## **License**

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

## **Contact**

For questions, issues, or feedback, please contact me via the [GitHub Issues](https://github.com/yourusername/ddtank-roblox/issues) page.
