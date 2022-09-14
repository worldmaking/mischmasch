function scale(t, ilo, ihi, olo, ohi) {
	return (t-ilo)*(ohi-olo)/(ihi-ilo) + olo;
}

export { scale }