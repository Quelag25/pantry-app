interface UserRepository : JpaRepository<User, Long> {
    fun findByEmail(email: String): User?
}
