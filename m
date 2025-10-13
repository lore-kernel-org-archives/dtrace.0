Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5CA224F3
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382971; cv=fail; b=C8fhehD6e7sjX/vJfU+5X/J/ZixrgEE+LHTEzO5BEN5Aw8SE55Xbj7qQudpxP66mIDkjlkze99CtgBv7+CbkSZvHCuT8xtnGPr8QMcmayUg5yc/iEGzhDKnSJciFD7QgIB6NdiNISHn9m/BKq3sEuYBegf7LAZsDljsiqtiI9Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382971; c=relaxed/simple;
	bh=m0r9TP03h1Vt9UzVq1rc9VxM3abLYXh3pYCjxC6zAFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ta5ySnmvPYr9iY456mokMI9aUDvUcvLlizEtFURsuj0bikv9QC0FA0OQV5yP04AefbO8+VGaHXWn3bKeLxIUyEku3s6Lj0B4XULuWzUPch/fd9SqEGK2V18TYtb5Oxfoxci6ZciG3wt71KNgtI/dNmj6I6St52qpzVmJ2RFR1Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MMlB1SVr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LQGjBAgk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MMlB1SVr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LQGjBAgk"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DFu28a013502
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=V330Gyqt33mgu0MoWM
	ELyDDFEyiradrkYpgo/kMBFpk=; b=MMlB1SVrDZrWHMbZ0L0XnNFVu40xLBRUQh
	WdvSJHyED4piO3is9lW9yRe/gXBssKezLGgVG0LV4x9SVP372yJAhhE2Wf1bkATr
	xNw8LvooJ2dYeT7bOwMXhv5UjirD+jms7GxzZnn1k7SEqjuLMcgNYSpWVVKFx8/K
	Rvn5yZWxMDo4rYQpJqwRgC3HodT/9gC8V5bjA3dKtvp/QQ8wgkNDUWxxQgXL5s1q
	hBGWQG3DEnGqUlVCIETCXR3kQkcJ1+IyYTd7e6rkp51NjFI52YhHQinfTRbUi1H0
	hCErrvHw0o9svYXelZjlaTUDxMaq5sm8ckHgOr9aWVFcLVexxcPw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qe59axy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:16:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59DJ7Mro017161
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:16:07 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdp7xewc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:16:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOBbF+Gg9csSiK0GGSZWQX7pV5g1IySx7oknkSihJ9FazdIMTIFcsaJX+GfzdjZjVGPEF2gHK2/zLQ5ah7u5z31+40rslLwwmO5UP2swM7ANai4aDv9AJotv/LUOPvmYVczMK1x4vJLj4FosU5sq6htnrhrVaFz1b9GbPrDygCdHssDyM+TJENaIoPA4Dchtl0B52dENwyjBdCHxWwVvPKn3wqylJlDf/5JZGwfwGhfjBcySYTTQLva9h8QU58lZhOn+7+CcX5M72b0O8mHdrhKsFGxPgvYvUE9jZqZ/7TkSDhDOs1617Gle6tLF/OBx4v1uOythKJM0UYY+I9yggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V330Gyqt33mgu0MoWMELyDDFEyiradrkYpgo/kMBFpk=;
 b=rvL0XeuBt2N7z2fR1nJLii+F4+rjdLNpxhwsYeo02z7Xk/uQqLZJKrTiIXvy+6yHvGIx63TyY0Rqn9QDQ6jvUyYDyKOw3mIPPWIaPIEg2UmQSjF8oXJG9xCaaw5saAr3Hw3KD0HaY6+BwxxSo0qDl7CMaUjiK/XZGxnp/ryG/nnm3BxQpllI6Q/j6CsqAn7znZpAB26/VbsiWHD9b9FeMgkWt+9+IlqGBNc57jf0J6Ufnm43ufdPAZN2/06gbFdDnwecuxi0WkiM8SMh8+bXFA6E0RVgFlsKbF2IIuxPkTX3/khbDQ5377sHNDBtYEggTMYeqnt0Lle+8ytvZj+nCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V330Gyqt33mgu0MoWMELyDDFEyiradrkYpgo/kMBFpk=;
 b=LQGjBAgk6rUBT91jpgRQCjLdZiWUN149eerTR9zScYX2dQIoz038Gn3Tz5bq3YuBj+STujyKeRZV86HlD33/qptNoKZnPCsUGckprlK5dlP2d7DXIchDc9Z1jZQiGRFRV25EbF89v4PhoPF2flgzdW89mUmd4Twr0E9YqIXursQ=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by BLAPR10MB5028.namprd10.prod.outlook.com (2603:10b6:208:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:16:04 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Mon, 13 Oct 2025
 19:16:04 +0000
Date: Mon, 13 Oct 2025 15:16:01 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] test: Account again for variations in error messages
Message-ID: <aO1P8bIOGHHkBhZ4@oracle.com>
References: <20251010035003.4865-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010035003.4865-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|BLAPR10MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b3dc6d-284d-48ce-07d6-08de0a8cf425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?817DbAuYIkXmYuEty0zkpMfRxXBy6QrPu5Aqs0YiD19peI7PVjDzsABegNTO?=
 =?us-ascii?Q?Lja71108X3f0k9j1jE/GcDfk1y2PibmzNJ0wocDt9docc7ygdH7vFnze6Oyq?=
 =?us-ascii?Q?Nh6yz3jvAYWLaS7Hw3oI35SwaGl1wbMZivMH9933ajs7Sd0wB6rcDtCll4wV?=
 =?us-ascii?Q?veLcfN6xdCfCLxogMKt5JL3taIwH5TJ62v2R2qAKHFJ6BzPjsReVmkJy7nw2?=
 =?us-ascii?Q?5poCi4YxpwYGXvnOxG2Ky6u8CCBPcx19nEn41NkO6WvTx3uhjeTkEGOL1UGy?=
 =?us-ascii?Q?63MXxn0ALhx1JP3slEmFUcwlN6dr1Gdh4iC3OYMFfJRtRJomAV3CzM/2r+Yf?=
 =?us-ascii?Q?4oyyC2cCIOBPUrU3gU57LzlIWttTBvQ3mSPqT3kCbNgmaXIa48KcJ93cwBmq?=
 =?us-ascii?Q?r/7Abk4BR245DPrcewF2fZgQOsW75I1svLmkMVljE4Syh986hmr+U4SZRGAG?=
 =?us-ascii?Q?EtnqkTDUvnDN6OlQQIESEjzO3rczHVeDYWqHbhLc++UCLHqGFXVw+ftYeGQ7?=
 =?us-ascii?Q?MtzDquCOaBR06fHIwPy+YQ/pBBu/XNd2jX9RvP4GmZ2ZwoicAw7dnJ38vcRU?=
 =?us-ascii?Q?MuGRRAbSnCzEaz/sHLO8NIo5hFVYtCeCEjNTH5p/vj6IdtTsYqsqf/q3r5mP?=
 =?us-ascii?Q?uNZJD9MbnPnM8nXkzm9WRUw3aWgYJytz+HtXHAAISbyQg0q5JQh73mdIcuye?=
 =?us-ascii?Q?iwUI8vaTTGvawH+nHahc62Z6O58M9cE8wFEOR+EJL0hNmqu2aTYtx45W8VwU?=
 =?us-ascii?Q?KSvsh7Rmb2hb3dlBZ9Uxa7LEsP5f+ITZ2AoYB7cHV+wgd68eYxNt8p6tI15P?=
 =?us-ascii?Q?lb1W4Tn/WT5BOj3j4HaYzeoDKD6WGc28IL/gIVmKNhQnvgzSS7K0sP9qCYQN?=
 =?us-ascii?Q?xymTdFzumnda70dhyW9YvS5PqqiIx3BdN2Vh7MqL8dHfZYKlBbosTI23/NKh?=
 =?us-ascii?Q?FjqK9j/6EwnbHgL+PDgO844yn44bg9KdH9rMm1XEWzC1hy1tmMBqo5L54ZYZ?=
 =?us-ascii?Q?6gAQhuXVp9o5e9A8xdNjwjU0GjrI7Fx5N8cr227GNfEFYL/i0QpR0tqDGYfe?=
 =?us-ascii?Q?oXw594wiaQ5l5V33qe2IZtEGF72G575yTFnhax0vQF4soQjnaD1u63EHuBB7?=
 =?us-ascii?Q?2bWXC8W0iRVvwLPgnQ3u0G8USNsmiLtIRdiztYJjI0I4dtCRX1At0v3zaOIh?=
 =?us-ascii?Q?rB6YrdyWKKRBlA/iM37ijM/7zMbc50Vs6ndqt0Y4mq8vbecZcVY71XXzW0K+?=
 =?us-ascii?Q?L49m4ii003wlnvDWWnRiyvjTU6qs2nqnhOYqqsdqdK1eOznPK0IYkSFiK+HU?=
 =?us-ascii?Q?nZDCfcidp02gS3aTuWkbFetVeHchVA13qx4z+vuri3EyKon8aV6acdA7KrGJ?=
 =?us-ascii?Q?zZ0EnkOMrD2b7TfWbnUyejc0/u08rRodEGka7yrHg43PTh0MKTDGHvvfl/NH?=
 =?us-ascii?Q?Ni9+4oxApu+05TKaN21Id5bBnpxrg82V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tm2dtBqr6sxOm+gzsH+lZHSHBuiUg2hoQLPD2Z6g1X/kc8QvSypd1aVBx7ZJ?=
 =?us-ascii?Q?mQwJL+t/4CZuU3kobnhc6Ruq7a929I++AHCqQ/Nc+Dh7ykb3ZuEQyHTrhO5Q?=
 =?us-ascii?Q?Vf9ZYx8ew4aDQECxMPzGjqNctOTJKWWVaW6oS3rDQVhq0/P1vWTYpodBBCZA?=
 =?us-ascii?Q?ZPKBNK0zJc/c1XCOpOi7ajkAGTjYiXunremE7QqFb41wG/1W7bSPLX7MMStl?=
 =?us-ascii?Q?qdTKNsCcGjcRpvPzkIn44XDjNH1X5ey6ayPiVjKsOoUBHTuPl6bhcOPfGoYX?=
 =?us-ascii?Q?Yrtej7lfECPTllvw5BBuU1+mVafAikbo9u6Z8j8E1Rj3/vnfQTgBYW4kiG6m?=
 =?us-ascii?Q?HlAvCQoUISgenY5OSwRQfhu4xNO9V/8UaPge372uod+rCCjgvaIvK57QIVxU?=
 =?us-ascii?Q?P2TXylDYY7IqkkXaZ6gCbQQ7z1h4+YuK8GAMi/XUnM5xKTNeXUxqdDC/tnCv?=
 =?us-ascii?Q?zRJaYivEACu9o0KCMo8XRmpHs7cBBiy+6cw2G9OKKK680cGtYJ6ziOkIwAkO?=
 =?us-ascii?Q?Mc+ZXaU5GxGIMuCEaPrQZDVOFgY3ubDi1yfyPuPcoGKEZDXzinzVQPCyxhn4?=
 =?us-ascii?Q?lJRCSq4NQgIv/7k0rS1s0i7BPjpHUXaKpBhZcwlgeF4W1PK5bOYlZjhoL4rt?=
 =?us-ascii?Q?dOXHcQI9ajar8Xg5ZIf+Nvv8pTbpst1B/e/cN/5+6NmcT+xh9oRVlP5aaUmx?=
 =?us-ascii?Q?X3s/LIWadPJPyVpY0ifTpPEqMj7+r9LJVY0F68r6TO54jM/GrvAdPCMu2/MM?=
 =?us-ascii?Q?D++Op2d+O1Mtt3yTWbFqE4oR3pvZ7xSlxvF5PK1j5YGJdRr5+Ap+a8i6oRzI?=
 =?us-ascii?Q?Zhv4VqlpXK1PCB6NaKKDV0Jtw2mYg8AWcIOdQOC6jsaR5fyK7hELzeACqdXQ?=
 =?us-ascii?Q?a5LTyN7Cgxf6lrACizl40KxKzYyr8MX7Wx4QoyO/gfTdPzrt5hoAvp+bX/NM?=
 =?us-ascii?Q?54/aTNMEEO97zy52YuVUN5+BTLoPRVXyBzoRNElrwH24heCDbAVrn91NjQ3H?=
 =?us-ascii?Q?KhFmah9G3BRzU89GGrAT1wisoxS+Swzu/ulKkbCd502f+nZGbPsKirXyIKpI?=
 =?us-ascii?Q?G8EM7fUjyduLjmhS0Lp4W+GojPd0lGRQV54HJMG8gEgYgo5THPWIKJpw/J8p?=
 =?us-ascii?Q?+G3RzWRYHw5KSlFwBJjkYvGJnxGxocl7XnQE1pNi/SMM9zkoDiWPkNoed2nF?=
 =?us-ascii?Q?/BY7YQcyB5+pPG4vYHKxYR7I23mnkmlY7UMFWNBg7Q4Zdxwrri6/nEAqrgQA?=
 =?us-ascii?Q?3cyhUi3QHn8tHdbtrk6bY6XnWZQY7pVFHfr9/HX1d2dX/s/bLGErfrFEvuKj?=
 =?us-ascii?Q?4osqzCrGLZPN2G74N93/PbyFM+W4AuEcvXT2hdEdP6rgHKBnLBGWW5h5YQbz?=
 =?us-ascii?Q?NcihtdY+yON/8ciGOtWXWOSRNyq5jIGCt7SsNY1sLjdKKo9K76YnO4WVXWj9?=
 =?us-ascii?Q?oJDjJUgon/nYYrahji2DhuS87wRXBZ3PHTO92GGIwSISb+5Oe8+LWnGnlyUh?=
 =?us-ascii?Q?dHOM26S7WPT5r6srn7bvBC7Mbggol3oz+agy+huO2nhWWc9IIFJzXcvq4tFA?=
 =?us-ascii?Q?Opqi0Y/gfF2UnW1DoqscGw15RHdzJ38+6KL/XUPi93L6wpxsoM8IZNb71GbO?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OHm8G24fdYzt7pjBYezRMHVEbmwjrp1+Al+T074JklJfIv1mwYT0Z60dNRnE9aKD9rUKw6+1x4fK1r2QPujc8E5rB4pfmtR5/auzgie751pMEXCjsgLKQjAE/FStwiEC0yhcyggl5VR6MqJVDmxXhUl0KTVHFP7EgWcnsu5f298HDPSxMkj1Yd2lfTTN+YmS9D+tfa7KIdB9h+XYudKeEOyihKHr5Uz717WT4ORbKV/fdLJ0t9OJizGOptuCXI/y6CY9BfYHZ1Wh05tZLXkn76eZW4E9SqsRh7rUwBRR025h7jO11cKZDd7LvXXJbRsED+gi5JhvcTER2yPHlczn1v5wFh/YQYk/n/II7MkeVGSvUKOUuscMYd5nDuajFDbTriek3nC9Ns0pycBn5XQjskj6S7F2ZjHzrWH0B/55S6y2vuVJTVqEy+6WEYz3Ztvx9ET5J77heSzePeYbp1foyUU5qvbXwCHOn28S6dVFU2BNqNgyofOmecuxQ68dnMBCi56ehnv1+2qtRS+lTLbWG7Dl9feRLqJjPqnIjMfGvilvH1EK8L6xScMjo5RHpNvAvpFIuqyHgLRFJpnejsE6Bp/5Lgyp6nI5ypId52U+XyU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b3dc6d-284d-48ce-07d6-08de0a8cf425
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:16:04.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdmlNmdmFQOhHPRj1CIRzkcHTnuqQYzQAt76uaAN7ZJKEdRSHI8VBkHg+hWTyq1FDHYsANQuVzdvzD8DfVTdTkIP6hrBGfoRRtUg6hJzDLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5028
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510130086
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMCBTYWx0ZWRfX3iCrnuvjOG0m
 ZPH7/JP+fF89/sZ4XyhzKIOtySZolOUo2Zw8V2m9rgR+HLq+K+zi7gdkE0jTAupCF310MLSyq16
 uP4yrFm7jPzTRbFkC4Z82lES90y8FMrwqI+5qcCvVwXh6WdKNf0q93y4SrfGsmHq9+we5KMVQrB
 0e1sBgGcnYfdCzgMae746i8Kqk4ZFlbouWNK8qKrPOMVYhdHMz6K3NnVKs7lgiPlDdCkzkkllxW
 jtB6AQrCUgCVioXq7MScxufEviWxrWGbvoVDoZCiu61bM5TPcazDt1O7YcZ+avWfSO+yqMsUEAI
 3VStoOXcbMfZJ3YsU4hG+9VLc8SJB9ZoDHQG1zGPeX4U2HY9zbPEUZXEKZjYoCy19lcHfDhywTW
 g+HBnSdXgFhjVk/VO7a2c/29xw9N1eUkG92s7HWa4w5Rlg1ufZ0=
X-Authority-Analysis: v=2.4 cv=V7JwEOni c=1 sm=1 tr=0 ts=68ed4ff7 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=sWKEhP36mHoA:10 a=yPCof4ZbAAAA:8
 a=KmXTMu39Hx6q1_3XcZ0A:9 a=CjuIK1q_8ugA:10 cc=ntf
X-Proofpoint-ORIG-GUID: Yg8yHfzdEGDDBmid56rUXLt1YZ4UipaS
X-Proofpoint-GUID: Yg8yHfzdEGDDBmid56rUXLt1YZ4UipaS

On Thu, Oct 09, 2025 at 11:50:03PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit 944dac095 ("test: Account for variations in error messages"),
> an attempt was made to account for variations in error messages.
> 
> However, it was applied to the branch after commit 49e646183
> ("test: dupstruct: fix extra duplicate identifier case"), and conflict
> resolution was not consistent.  The earlier patch "standardized"
> messages by applying an optional "enumerator" where that label was
> missing;  the subsequent patch did the opposite.  Subsequently, some
> logic got messed up.
> 
> Fix up the logic.  In particular, standardize on the newer error
> message (with the "enumerator" label).
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/utils/libctf.r.p | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/utils/libctf.r.p b/test/utils/libctf.r.p
> index 8a6fd8b13..504d4b59e 100755
> --- a/test/utils/libctf.r.p
> +++ b/test/utils/libctf.r.p
> @@ -16,7 +16,7 @@
>  /\[D_DECL_IDRED\] line [1-9][0-9]*: identifier redeclared: [a-zA-Z]*$/ {
>  	sub(/\[D_DECL_IDRED\] line [1-9][0-9]*: .*$/, "expected error");
>  }
> -/\[D_UNKNOWN\] line [1-9][0-9]*: failed to define enumerator '[a-zA-Z]*': Duplicate member or variable name$/ {
> +/\[D_UNKNOWN\] line [1-9][0-9]*: failed to define enumerator '[a-zA-Z]*': Duplicate member, enumerator, or variable name$/ {
>  	sub(/\[D_UNKNOWN\] line [1-9][0-9]*: .*$/, "expected error");
>  }
>  
> -- 
> 2.47.3
> 
