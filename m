Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3915F2BEFE4
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589547; cv=fail; b=mATi9zOMLW54wb9tXAntxmpEEeI+1rBpeplFM9y8Am7TnOLwgcYHSlM/bmsoZD7g2z/Y7XULZohRHtOS67yi1uj3Hoi6FCkWhTYshHkKcfH0lvU1bgqX7ARhJ+IR8ZM9QMUo5jk/SELTxmDsmckv+AqT6BTerwfnEj9AnHQ8TD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589547; c=relaxed/simple;
	bh=3YjaX1lNYtAAeHIFkSJwjHaoVqbN1P2eN2E8DqnnUTs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UFObb8nzUFJM0qCs6HdNt35sstwebXafDU8NU4eZfWkaLgfNP+xYc+NQS4fsfwiFnMR/JdvGAfJ5qBLxkAbufyeuFOnJN77Si3ibU5pLvJIiIu+EVxPK3FAFgOEfOxDiMrUI6i9zv6v/1MykvO8sR9xk++ObtqgZ+Xp+bp5+xww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FuEHB7Pt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lr1pX9wH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FuEHB7Pt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lr1pX9wH"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RDYAQq028537
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=olqEHe1rFjXl0nJju1yqGc6iWKe+r4oSIcp3T8PQcBE=; b=
	FuEHB7Pt87l3wvbZ6cVRBUbgmKSEU6uAaNJYdXPdG7jAEfMjvbwENQ9h+L25fg9J
	H/8ZuJjmTrjKDERRBeF289ZwKpqSG8Ve42E6a+GIS6rN+U3JMkBjdOZqIr84ktUQ
	BQSyog4v9t0nJGXNqckep4mlvbMRhDYEjuLPrZ9Hty/K6kWk/i3ZXJG7mfrXHlXQ
	qZTGlTSZkX53Kp/UVcF+P1s2OyakhCR29nF+Ed827sbvLKciD9/3xPV1yf4AfF5N
	w55/qiJM4V1LgamapTl5J4CgchNjLkcv7Z0+iMs7fME/WwkcyjglMnc+WWruRjwM
	UA5eFa9RTi1QWBe+br9WOA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a22uu9nk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:25:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59RICRq9025102
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:25:43 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n07dbh9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:25:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSNeWxwk4cYXzyDcgvsKOA9k9rncEgYIqjsw3ryp4JJ42z5B4Cb4Bc5ug5fnYSE5ciL06lSFaFkDL1wmP7l4/pTQUCv92Pn3+0CfLtrZLGN5joVO2hEpZHnD2xjGigICQ6OKvsWDPFpz9SGQW9PC7vgTFdlj2xDJJcpU6DhWtdDus8J+jYrAR4xEqARVwmPct/+56CUUUOE3Da/2aqkEwTJ5iEdFk1ammHwqcRndPx3WofUOT9OzSbuI82n3y9Qr+r1i2lBTtevL/Pj2VCVTLyRnL6qTZySqijd3vOEfLhX7CDTlB/Xrb5r080QF1Ow5mkU6xEOmiuo1wfOzme7bTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olqEHe1rFjXl0nJju1yqGc6iWKe+r4oSIcp3T8PQcBE=;
 b=Zu4NjlpTTM0VIPNEP4Enzc/p4QzfKJ8XusSol5G0pYQXJzvTmxUSnDaht3t8BKqu6mW0jgr77o8EqCUsD+EOBaZP0JmjTfRWAEKQhbv3qtY+NuupguWiXQvAUhjEib1Oco/6zhElaqI9ztJLj0pkCFxtQm+wdEyMAtyaSGWevl8AfTt1scCKapVVe5t3dgzzFvtE1Kuq7Pp+j1CnXWwENIDKzkXdhIoha/6UYGxecdkEiALiXCzMUYJdtivbYI1ooz8N9mNuEBCr33wTHWdPnSv/28+PgQ4xt9oxXCmEg3Ql5I+fHPd16+tS7XhKs0D58OliDgAxO3SEKK4Fn5wMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olqEHe1rFjXl0nJju1yqGc6iWKe+r4oSIcp3T8PQcBE=;
 b=lr1pX9wHUxIefMdKymK07CbUaDJV8b6LyeJEVoA24fpb1diN02BjhyeJrgZhb+infi2cfY148W6m49ZO5vmogSACo9NxM/w9m/xsoOGshowEthZ08n2Jir7eN1SsKyBmiJ2nXQgqAjtqdsXt2YVfaRJotvs7+jpoGoD1rkRkOzE=
Received: from SN4PR10MB5638.namprd10.prod.outlook.com (2603:10b6:806:209::7)
 by BLAPR10MB4979.namprd10.prod.outlook.com (2603:10b6:208:30d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 18:25:41 +0000
Received: from SN4PR10MB5638.namprd10.prod.outlook.com
 ([fe80::d7cc:538f:ec91:3d1c]) by SN4PR10MB5638.namprd10.prod.outlook.com
 ([fe80::d7cc:538f:ec91:3d1c%2]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:25:41 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Add more Orabugs to dtrace.spec
Date: Mon, 27 Oct 2025 14:25:37 -0400
Message-Id: <20251027182538.20466-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:510:4::10) To SN4PR10MB5638.namprd10.prod.outlook.com
 (2603:10b6:806:209::7)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR10MB5638:EE_|BLAPR10MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 604d929f-7d23-41d7-8cd7-08de15863b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vxTJp53SFW7+ozB4Y9iWeFt20tx7w8p6FZm6Pof+H4CGPSKHQ/MCAc+qLN5Z?=
 =?us-ascii?Q?ywUYMdb4MAKGdRsB4lAeU1UCXvY2xJLcN+P7Ka0DGnXsWdGOEKxACXw2boZ0?=
 =?us-ascii?Q?CtELzIZrjbeN0IxzpGRne+JUuXJAo0KwLIf6DtTlVVYaemCuXq0G/crijZqP?=
 =?us-ascii?Q?tXyisWMpdRubwbH5PYd5NRCL4MymN9cOaU5iles8kHfYZ2n760w4FUc35dy/?=
 =?us-ascii?Q?iSBN+CVezlQHfImck11lxW3R95D4fS1wpQBMWtlHo8MFeB5tD6HjeiZ9Ucb2?=
 =?us-ascii?Q?JaVd3b7lXN+SYgvHgJWsTuQI9c9XhTXDwdAVpPNQfHywlrdCxGYatn+sCpba?=
 =?us-ascii?Q?YRqqodAJZMeygZVj6BQRItITcmWAvLZ6VbIeiKIkoPle8HqQRB/D7YFTnQ8z?=
 =?us-ascii?Q?rO0inU0GUxUOiDJtgUH/Y9VyfKSMykR/xKcQ3obglSTAmK3hezqMq++tyoVr?=
 =?us-ascii?Q?Coh0j+7GEvfpO8QhC5grvwtbJZ7ceyXxKOus17GDfM91U3q5nY1dFwCNiplI?=
 =?us-ascii?Q?oNmeSdYftz3BASKvPgqjTRtBVOMRSNXgDH4qHBMw2Hf7hSjsgrb0b3ENWIWQ?=
 =?us-ascii?Q?mPRx5Vy189RNUwACvc2/5BazsFJYUsmG6l3neRBgzUbPrVyHl/x8QCXv6BGh?=
 =?us-ascii?Q?E/TFdx0M2L3WhAtTdM2mksoHDCy4KXKpspPJs59PWaYjEdFZQp2SpdZ7k5a6?=
 =?us-ascii?Q?bIN7LELqRFR3pnTy/yHixFxhWlGm0cxVFdkXx+57z2hXsRCzBFEfBYGfUj2u?=
 =?us-ascii?Q?DYz4NFmxT2/a+YC838eDCL2Alk8FlgpLA8tmZY7OSIX23DCFrCXgnFM71tMH?=
 =?us-ascii?Q?w+uPPyQ/6XNRroh81kZ8dL8cFgvhK+VQxkMSxokLxd2XXpsBN3kkDVyP3COh?=
 =?us-ascii?Q?mfvVhsYQAbpJOtrnZw0uyDkFU9DEb/ncx4ePA58jp0Olj1EBXViI/lh6orrz?=
 =?us-ascii?Q?IjmqsjfzayMV+2qq2TxE55L8weTOyu0mrwPTqPo71g5D5QL5R53b14+HZP7y?=
 =?us-ascii?Q?yHbciQWNMXSTNjF3vrHwfr2PfjcP942k8BwTaNhbi7gXNpv3L8Y5GoJAoXuB?=
 =?us-ascii?Q?oSBetXjMkEw9809FJx9PHFypDDevfh4cEKZnDKbVHf/WKlRliiJdq+i54/eN?=
 =?us-ascii?Q?T+W92JFUH5r/VwlIDtvZJA2Bf5F5IciQpE/rYqJujOzodA9F52PnpXqtTR1Y?=
 =?us-ascii?Q?LyZv9kkOVXEL+ae+PDhTPE+1exAr9I5xvoQrjdMsOgKaJJqrCSKBieyYXZJu?=
 =?us-ascii?Q?i93neSXkG3SOliupmo2+gjmi3xsKqXF9mrBlruBXh9Lhgscfa0sb9GzVhwZl?=
 =?us-ascii?Q?sBYIRweC1TD+isomH0QrpWfprODi/gTPtv8D6WbFloaHqUZQGocF4VyVWM02?=
 =?us-ascii?Q?I1LfNRCJfbyd/AOfDRhyh2v4rAiK5KwXTvrewBdHKhIJirAMkPjMI2TQJZoK?=
 =?us-ascii?Q?kYofu9VPVW/d7hAFNeiILR6ty+ZAXF6g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR10MB5638.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yEVEn9fDn7CbnmAG8GC/aZ2QoiTegvTq1c4o96KPyDf5I5J5RPufjkGW3hSd?=
 =?us-ascii?Q?Q7NknzLAJ8xCJs5DxIO3RAuuMqbD6CDa6XNsKE0LhhOza/L9ASUWV+vX51YB?=
 =?us-ascii?Q?BeNOHYvI0N1GebL86m1MZrWNCaCJPJhSyOCUKO0yMd2hIBKyBlooBpLipiVg?=
 =?us-ascii?Q?k0ahC57PbJQ7yYOfj98pyS4aGOZlb/PVeg4vCj1AGjOBf5Eo79sTXBT/eJBy?=
 =?us-ascii?Q?AePxJcUstwYgCuO7gUgVe5gPh6HSZm2o4/mHDNQcczSpnVsF+FWii65gkz/e?=
 =?us-ascii?Q?NhCgslo3V+mEC20QcNpPCUTCUgWnd8NF3ym/2rDeqf4/Yhhqqtqt/ekPZpqL?=
 =?us-ascii?Q?hKB4Eb1Ww53zuT3Y0D/28BDtKBe72657SVJfrIZKv5vRiZWVchfweUUX1ec8?=
 =?us-ascii?Q?UkoCWIPipX9Yv0ovhq11nqnmMZpfPQd0MfSKFLRx+kbTJO+/+aSacUa5+oVB?=
 =?us-ascii?Q?GhkNybGclj5X/j1XD6yFuMd1EWOaFEvTghOUDCY+es8uXdSsZHSgdHIRoJBb?=
 =?us-ascii?Q?7hX+NfNRUQHpwm+5t50NbAw6f0Z5hMn8QF84lz7yXz2w615ZUPL8Rn9hUUMT?=
 =?us-ascii?Q?j0BpwgPf26JJnptdTq9sEs4NocBmhl1o02F6XA+93Qrn4B0Ty6eLCP7aPXwL?=
 =?us-ascii?Q?wRaWTQ6uk4eMhuWrZBLa7OirZQP0YRkpSqWYGmup/6t5gZ50nLYrdNpgtbPx?=
 =?us-ascii?Q?VXG2d4amNfJtiijOMDhv7LTFXxHQyeKsk6VpiRdm9PUmK1V9haq2MkOm1OkW?=
 =?us-ascii?Q?Y72IVLhZ7Ql9RTFTPZeWmbYRBnDalW+VPG4IjcQ68E7iBoNDd0NxoLui1ijE?=
 =?us-ascii?Q?l0wBOt2mkHntG5G09hmNywxo8Rl+D2veWVqPyIOk7YP+lZVpxUniR4J4HZlh?=
 =?us-ascii?Q?TjPsfIfyOa7e/EKqtWoKoX7qeHjV1zi3aSkITR2KUMOtfs5IOewGShNzhZOs?=
 =?us-ascii?Q?X8T0OYzQyhzFaAU78LLO/Q2X7DUWuYoceAyYsfdWeNjafCDWwoyt1WvX7uEz?=
 =?us-ascii?Q?ClyF9T9aBbWJlivbBh6WhGqXIelIWQrG+X2AUXUHX2i0kACmjdH24t21vP7T?=
 =?us-ascii?Q?Ogdaw7YDMdPCIBWF7QXVNHwKL56+m3aK7nZXznIi+qtWEehLeQchBSgucbXO?=
 =?us-ascii?Q?192uWgDGev1rR7ueJqXK5y/4uFhXkOEKmOl6gQnWryGYkNGjR0Gugx7aes+L?=
 =?us-ascii?Q?5dT3h/sodaL+baqeaA5J6r96zx6zwllmBXvifPPEhfrGD0+05GUVay2jUsKS?=
 =?us-ascii?Q?668WIcpOzP8KDTYOoOBV3plBp4vEJJhDgU5HruKdsbBuro/6+l4Vzst83E1C?=
 =?us-ascii?Q?ziSzjOMqSQcKDcdNXDQZ1gF1G3ddwuQokX1qlxj8vvAqpuj/NuHC9XcECziO?=
 =?us-ascii?Q?ClXPHKCDN+cTP6kcD1ZQRqpEGlJkDOyEbybQSFIJ6p6za+MmiUGtgZyhX5U6?=
 =?us-ascii?Q?iTo3fUSITJlkTlIrU7uJCcLxu4hnikNY6bkyoKpWNeoKgXat+mbnJkrnlL6R?=
 =?us-ascii?Q?296oAd0iuPOLRNdNSoyPvkr819cau7KiscXNKlOuS8Mv9Rgv8owjyh1hpGrA?=
 =?us-ascii?Q?Tei5upbMzevFNYjLzrvCiPxpbS8UyKWcwRWcO7+p?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0/OQSi0L60+vo3gpytXm9PUhbQhlhVLjNiWAz5B0ZfUMt0c6r49VVG8TwBfI4VCeOX96sLSOSgm6imMkW9TNFdqIMUthN0aCRrIBcoaqVNUdXQaeH8Pw8Tm56ckuTaurHAAe7oMpU3E8sFUzIOKbKqSp02qCPjY/Kg7qzVVhIFhnfFUBzLe/80JvLUc+O9YRUD5t0aQxEDfdpHCTduKywOvhrOXYQUrEjby5Qie3aL9vtogmvLGVUQttXMbaRt38U3qYRBGUVzLgNl1q2Ci0b4ilJmAwY3ynkgEH+yed/0ltWpzuV2Vhyq0omxXpWlNdCaZXcYFLTTRV+MT6IYUNy4limz0NAuw10HBL314cKyQs7QHezOtFww3IwXHmmf52RjEXCuV9R1RFeQFOUQomy0wSnWUw0VVMFQNZxhIOUKG4UV1n1u5jBFRJ8jcRi6Bt1/Tm8XPQ/LSK+2PifLvaWzVdG/LQ/M8XKMt97rI5pKM27iugITi0kdyzQdaRD2eEXjvx0RgL3qH2k9gSZhZd9nLEQbAms8Y1Ekku30wCoFkWHWtZxYV7P4eo0rPQVvZOePQKpITzS6kyNH40c6OM/tuTlLEVLmvrn4NckB8UhxQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604d929f-7d23-41d7-8cd7-08de15863b9c
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5638.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:25:41.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ulaq2aVeJZraR+EGxnzGJUNWzb0TkAQNgzE41F8laaGXYNneRPyyNr3DgQJIcybE5zebgduGp1nQXRcexvuS6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4979
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510270170
X-Proofpoint-GUID: cZgeW6zkbp2sCbGAVVyXvSAVRbrsMkEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1MSBTYWx0ZWRfX8qsTVV60MSWm
 ZQLiBdngooQdromFZLs47GHeOI48uy0qpolaoY9c81Yt5lcvVsf1JTGDE5MiCUa2DACXVM5OF1b
 4sBABCmrtBgKGbIT+XNVRMyFEHXxEocnGdpIuV4CGYNWYtjNNgx/Jh3fF/cyDRr6ytI/Y/nK0lY
 0KAdG4I4yAWf9KMCv5IvLMCCbamfvMsegSIcEo3ONwAwr2me567e4GUBxoFsCb+TWAoFGFXqFcd
 Cy3v9WWU8VqB1pbUm2vifSrUgMTnvrWYuac6rVIe+NiwO2QWiCrG2F3Xy329mTWVQcEcBDuhnJn
 16mIUVQK0ivWreKN41xhPzhiDcs1Dw4NJ/gFXUkci85VHod71+IsKwyiJSzP6TlfTxbB23K07cD
 4AbytWtCRpvs5koCyRVEhLuCwVz1eg==
X-Authority-Analysis: v=2.4 cv=Xe+EDY55 c=1 sm=1 tr=0 ts=68ffb928 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Su5QVXOx2q0Z_AzHzR4A:9
X-Proofpoint-ORIG-GUID: cZgeW6zkbp2sCbGAVVyXvSAVRbrsMkEe

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtrace.spec | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/dtrace.spec b/dtrace.spec
index 21a370f5e..0905763fd 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -241,8 +241,12 @@ systemctl start dtprobed || :
 - Error injection via return() action.  (Kris Van Hees)
 - Improved string handling.  (Kris Van Hees)
 - Various bug fixes.  (Eugene Loh, Kris Van Hees)
+- Fix dyn vars overwriting one another.  [Orabug: 37994729]
+- Fix regression:  list fbt probes by default.  [Orabug: 38249511]
 - Various testsuite fixes and improvements.
   (Nick Alcock, Eugene Loh, Alan Maguire, Kris Van Hees)
+- Add test for preprocessor definitions.  [Orabug: 28763074]
+- Fix some stack tests.  [Orabug: 37459289]
 
 * Tue Jun 10 2025 Kris Van Hees <kris.van.hees@oracle.com> - 2.0.3-1
 - This is only released on OL10.
@@ -333,7 +337,7 @@ systemctl start dtprobed || :
 - Fix dtprobed to support DOF that exceeds 64KiB. (Nick Alcock)
   [Orabug: 35411920]
 - Do not modify input files with dtrace -G if unchanged. (Steven Sistare)
-  [Orbug: 35417184]
+  [Orabug: 35417184]
 - Various testsuite fixes and improvements.
   (Nick Alcock, Eugene Loh, Kris Van Hees) [Orabug: 35435195]
 - Various code improvements.  (Nick Alcock, Eugene Loh, Kris Van Hees)
-- 
2.47.3

