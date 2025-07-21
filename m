Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E51607A4
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753104907; cv=fail; b=gUBFLqgs+PWtMwo4cYixRdZTA/77zULzBBBPf2uYB4sBgXtUzpFK1nkstDm5k7m7bi8UA9gTV+K2EkLELPY++1ikDIpfAHsWVFjFNbUAHR1NyqQBf6tIzlKMR0nZWfMHzA8plL0XnOu6mHvQNkSnAAGwJSBOZ7aDyaVNIJUfMMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753104907; c=relaxed/simple;
	bh=0wbfQLWvw/yTOZfEqIAoQc/4zhXdBmU1qtAZ6H3u9dI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=VO4MKRtZJnFmix0uMJ4TUMr2m775kpzPd4DkPEq3g29GYk9tztWZUjCsPuk9Ts+WbZ5wAcy59dn/YLuSv66tK+x98yT5roGLhcWRBnzuJ1MirVFe2xHVJbabt/RIjApiHuFgkLkA0r8eBBztzXBOG4vVirL1AOQQ6FwR0zyApHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d23B8zV9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bWlJvTJB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d23B8zV9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bWlJvTJB"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LCNWWB020428
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ElhvaKYCX2dZJXzcqfVxnFo5l+rQfnQyOMSMiVMOz+M=; b=
	d23B8zV9yKljruZo5YlxOQBhX0MixPKKVpcult7c0bGbxHl3KhLz+QCA24q0AdBd
	OGMFcSIcvW6rC7vKj2NKzlI+v8WZm4Jbc/s2qQY5vZ+4gTGz/+CmDGo/F8d42L9/
	nv6jhtIj+Nikt6YvXsLPy4Pi6sLTi9P2Lujn3CI/oVt/pFuIVciy18mrv1NTgHce
	PdNZxBh9e1+mpgrBral4b2aGattJdFbGXvQtzlSYk8bWmfsvx/nx/1byXAiag6mk
	EWJSfzHDxiPZBxhuvQ+ubmT8Xz2Rn/m8StQ3vUn2Ig2rg9NOZoI13po/yKi+WKic
	8Ze5XugslhfqUn/r1klzHA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hpane7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LDABOF031494
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801teawsx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSbiVv0mmh+BD/yqZShWkMHGBCnj9oKtg7eIsfWRClAKn0B9V24vNUZ622HBgtJmyhMu0HJtbF54afhOligQCve+SKxJnL+IZ/jcJ91xl6H2/B6iybWgA/gHJkudLWieliZ4QBgmpy/dLAkDq/23bOcrB/xMARk88mwZGCbA6M+iLOM//AORLSXtx/zIxQywjU0G0wmlLlG5bzXRfj7fhW6yYnHJVMdiC610Z9/OjGcOLk0x8zW+17/RX25IfMk7MbOBHieM41bNpTh6pIqJ4/A69TDBRgFSUJ0jzeaQzZZidFJoCy6u/+bkASWsXArtkVSh6K7AQhl6iWeRMLXQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElhvaKYCX2dZJXzcqfVxnFo5l+rQfnQyOMSMiVMOz+M=;
 b=TOrJyzFqHDUW7Np4+FMEjIrwu7uweL0ABMBOAz7a7yOOfmPNR76Q8m9bmp77vdAkkTbDkFsmClr5v4holYzIxH5+sg3N/V93MRH0j5ehZvz1hlTqJiWTCc3ieD2q+kTCSj7f6rj4lcGWSYxlhqIHNwDxhG/14eqE3q1FkY/6PC4Bh/FHJWI5blkTWsGcl1wqqQbxPXrXHQxlDhm8/DChN33AXJ2YR3d6i6zSvhfae3FdNMV9XwNcPwxTXdZOsCytNWepHuz38ADbVSex5ZPTBf19bI9QSiy+fsFH8/gDhZEDGSypZiI452hKMb+UbKLS9Ovn/sLffTehZMwgE0d3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElhvaKYCX2dZJXzcqfVxnFo5l+rQfnQyOMSMiVMOz+M=;
 b=bWlJvTJBmTICXqYfUwhrId/ShB6xDZZsZVr9pepqO9Gfy3aUPecWCl3HNa3+EnUJNCs/HFW5SKX/CRqoXnxbB7yKZc3cfrLwjykVRLemigXlB+2AL2LK3iEH+ykzzVGnYvHDTA8t5sl+B7aGF91YrHQjKoA2dieOUH8ab4Ae0kw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA4PR10MB8732.namprd10.prod.outlook.com (2603:10b6:208:565::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Mon, 21 Jul
 2025 13:34:59 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 13:34:59 +0000
Date: Mon, 21 Jul 2025 09:34:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] dlibs: use explicit vmlinux`major_names
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672DB80AEB02AF32E7B5A0DC25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA4PR10MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: dff080bd-d803-4a65-9a87-08ddc85b6385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cyIpkwa3cgVebzBCnuz4lgnc1d8wyLjEX4imRJpouBJtv7g+ZBZ3bXkaYKUB?=
 =?us-ascii?Q?tB1yWBfiL1RCk9zinNnykLf+zCCuHMj/HS8MY4P7Yb4VUUWrHpY39I3yk5kC?=
 =?us-ascii?Q?N9kugSVqa1GWgrYc9kBoFa1BRPi0wUpG/kHNVPppmTyvwGlFwJxYwq4bgbEj?=
 =?us-ascii?Q?B94KQA/x3H7V83BflydbdO7n1a5hp51AYTCF3ms5GFf41AmsK2Vy5iiV5iiu?=
 =?us-ascii?Q?9UdM8BEWwi8SS8MNxO6FsRJJj238YCZGMX1VOxY9p2DhvI40uw5hQL/06POW?=
 =?us-ascii?Q?dWqHlwIEI8yK7cl4xqyNLxpJteNhMSv5OPqRkdse/ahUCcsw6h/ouOAYJf6e?=
 =?us-ascii?Q?PVhhfHbIjrg43dbimi3uBM3a9dlz71MP06w0ehf3OJvjLleJBdeq8zTzJ3TP?=
 =?us-ascii?Q?ojflOpA0eErO3IuXnC5DKe0qWBRW3iVXEmOSLfa95CcXjU6JvOkBLBRHOC1d?=
 =?us-ascii?Q?OMS3L6Vv8euXitaM7ZoxDnetw/DLCPx6Hn3KCOndBqCJPoRg4hHfsPm1H/2P?=
 =?us-ascii?Q?wVX+griUJTLAlao1pS9XyBeQUUrBNaivYEYJ4wbVOBNuyOFfTRURejMOQHHG?=
 =?us-ascii?Q?l8DuBTsKmWkpHTKKx6rL/Viq8FXcRfw4cNV9WSSZnqbOZF3s/J0fZZXg/iLd?=
 =?us-ascii?Q?vo7kb7txE4pbQfDlZk4GATF/h5TqUWRS9X3Eq1YUMR0TZmkQym3eDgrv01yF?=
 =?us-ascii?Q?V/wSO23xmfMOG4/SDqxUpewO/CeWxvRkFtAs3LQgqm9GwGYaeu4efGgSSTt/?=
 =?us-ascii?Q?ZGiZaIye7ft1BNIUDSZ31scxvCUMxP1UZ/L9VZg1ubeUCyItFVXJeJnlJtxy?=
 =?us-ascii?Q?4PSQZgWiv/UIvASMDjCZJ2KUOF4CzYFeb4DwmYP6H82tf6+apy0oqCd/Cm24?=
 =?us-ascii?Q?tBf8YIow1Eg48JyYXjnHhTm34Eeo0eutpmGNOo5S29QyWKTeE6ohR8iAJPMn?=
 =?us-ascii?Q?S2odZKjdJBBsaCLRzlzQ/apZKLfqGHcYSNQvgOmRPO1RpkPtpwlHnu8fHnNW?=
 =?us-ascii?Q?0YPUoR/1OLGiKelABSQ1JCYBLQSExNFifWltEh7awMO5Mj/xLXVQ+gcLu6gO?=
 =?us-ascii?Q?tC9NRnJ8oJWD9R2gFv84ps8R1Vw2Vy9s6Sa5ii87z1MJ67c9wCuy5SjTW31K?=
 =?us-ascii?Q?0MrSjTjvStYpNpNLl2zMZRhL2+oodRQkLATqC7rHiMvv1k+7ShHSlsGWNr4d?=
 =?us-ascii?Q?1vy1Ni9ujLWGMthjPr7GMpomkaXkjkpHyxrmbeIUCjY2il+24bkjPdfOVpBS?=
 =?us-ascii?Q?mfoSPelCCBwLHTmDQoHnQA9ISH5d8xGrIioN7QMzsTNwJTbr+TbzkopRWlLX?=
 =?us-ascii?Q?oIj5qXlwuzRSDMo5z4XuvRmg9X1xSfrJ46JRhqlnWHv/orSfcRSiIJBwWybd?=
 =?us-ascii?Q?xpVyHApT921wA8E0ppch164vN1Y5we5HWiBHmw7Qvxmwk8BMfDeCVHYAt9KM?=
 =?us-ascii?Q?skwviakZE0A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z2TFhBYSBkcZHz3PT6jviB9HJfqD14iqsyVM/3rfUgv0C0o/z3IneKHsMQ/d?=
 =?us-ascii?Q?g/AOD4JF/rNVDUf1dADy115W6KjVhovqx4dyeYLlMAmx4whncxlfO9OSHNgU?=
 =?us-ascii?Q?zCUD4i5LvMZ+/sTBkmsvN69YBPdGYLbL5emEVmAQkXkqrn15xObDqjGtLeM7?=
 =?us-ascii?Q?w+Onm+Yw9TvadFsO90ar7SbbkEaHkNvlPo8tKy7wMJNmEeyQj3DMAxsoVvja?=
 =?us-ascii?Q?6gU+TVRHPEFCrwgfsPlDU7I15fNeEcre5+ZcKIP2BxUBJr0UCAFFd+ATj19t?=
 =?us-ascii?Q?pf1L3vjBBL8iwXjKy8R1cdV6YftLDTDRBUapkY+Wt7t+S5/7jsxM1q7pVKK3?=
 =?us-ascii?Q?0Rs0W3v5SWhfkrIyoNSu3fRpCRMpZph94c3lL7YDljD0jgBOWeqVDXLqsB+F?=
 =?us-ascii?Q?0FXcj9XI0tX5W6pN9ImToAQ8ip19PmluI0MtwnKXCZIuKBNqgsLGa417v3gB?=
 =?us-ascii?Q?H9dp41/1vVnGOYitJmnX38RdqPje8FoNPb+XjT9Yw4hoPgzlzvKt0W9a/jr5?=
 =?us-ascii?Q?kKkeytWywUQi9HDDw/VcfLuY04OcnhjaHXRK0jRZYiy7DSsyvja8HW2n2v7i?=
 =?us-ascii?Q?d+v9HkvPXfA8QmxRZI2K1gtC/m2Bn+RVbOwXWO6HVlBTzJOhqGAwPxzwKvou?=
 =?us-ascii?Q?huVpwrj0OuwUNx8kOlIvVV9qW67VBSaI3SVox3MP/lvoW+m4ym4kVQvax5n4?=
 =?us-ascii?Q?sQhJ6rsNljX7s9+uFj5hARsobQgQcwqnmuRBA3ajHjWJUm8h1eWIXXX8a6sS?=
 =?us-ascii?Q?rr7+0LE3I7otzOLZkprIiMal4VzNhITnxOdf7JW9RUN1M0Vy5j64ZJGY58DP?=
 =?us-ascii?Q?VbDwojyifxgiLojlex5TAp+L96KX9Wkf8EyGuALIe8hYfREG3Lzm9kSDNqIU?=
 =?us-ascii?Q?ErZKV3lp/lyzaolAqEA6dRxBLdKetcqUk+IzDFj2o4niFyCjw3rUZ+ZR045E?=
 =?us-ascii?Q?Bii5HGhDJVSsfFrcYnHm6F54HQ116/gMNJBqBVLKOyd5jpMFg+zGEt0Zfjlq?=
 =?us-ascii?Q?gSXdYQm6bCU2iSBCIhACfpNv1oU3kfpAuk8v9I27DXDoGOk0Xs0QJHjqFFy3?=
 =?us-ascii?Q?boMhnkQaBKfrdBwDPwZrKhoL3F4pFcv32S3NGPffYusO8lEFuZ+g7zJA0Q3n?=
 =?us-ascii?Q?qIibhnYq5XuotPFhBDkV7KXuGzpmKu8ZLn4nwwoFkvC3MktKlWmWu3VktEap?=
 =?us-ascii?Q?uj4YP36yNOV/aLRQbZ4n27qcKg5goXg880kRJnlb0DB5r1py7Zcdu6EBX7L1?=
 =?us-ascii?Q?AeeiUMJ1ACC1xd9QX6cCdeQcpFKXPDAvp5hKB2pf2aC6pikSA7C73mCfzXbd?=
 =?us-ascii?Q?LD0SYtjNyPqYl3sPj98u28sWocnTozQKABa4ClYLchZ13pwRqMWTiHkdzf3J?=
 =?us-ascii?Q?8dvjydOuffCpY9o5C4r+onli/1KrKWzGKIY5gyoWM/xyo5fF9bvMiDwogR48?=
 =?us-ascii?Q?1VjUPfTWS79xFkfOP3KT1gBY+YaGlyg0yo4vO8Dm0xJolZ18qjKNJb1ufpGz?=
 =?us-ascii?Q?lzfXOtLcQhkCa3RrKysynMvqtk9sVqfKEPU47LGPr3ys8ZVowYymxx1NMnss?=
 =?us-ascii?Q?1QLsF0tRVvDSuze48u+E0KMey1bukWNPoCGZUZcf5T2MqV83QrVAuyGvDr6C?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	v+zuSxbVSbcXJ5+VU/eDrjiDC5wFhVXlqLa1Jo0OhC4p30DtqEy6mO+PjheQv7BBNieoupCPU4OUPWoDNfkpO7ydd81WzElltWU8BWnTWPwkbRsidQ/X3NM5YY4jEetlbu8y9pk/6/ZFhSYz3njh7dvU8PiDhMAuDaT6jH596wyuGUMM43vkFMYrCwW1P9Cw/JTTon0w6yTzxbkATtdZqIKdsekoEM7Da6u1qaUBoeImj0ne2KMgijA5NMXVdcKoNLNt9zdn/mJWyd66do61P0MgY7feSPp/K/KPvZspPgPHboDEmC1236giM07Z0TuYhogvj2cqOb17brajJoq7S0i5MJWu1CYwESwOSQMwU3Sbd/dGQeAVXPwmlGIP6eOdAzF0ATv1KzodkIStmZKTnHehT1a7fssfrDmLTranDn70m8sxAeOBVCwH9sT+6O6rdhRGt47zHfAgOlwXGSi+09DQfS1Wq9B/8Fe52QUhV6YkwkBa7XsMCwvPh/PWXkgHliNknzj/J1BRa7h5m3DRbhiunDYw18wB9WUleOiTt+Xa7ycIFqJECE8GyWAqFs5uU1yNtIYl0xN7aMN44aC1pRjH9IhufMqB7WClbg/DN+w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff080bd-d803-4a65-9a87-08ddc85b6385
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 13:34:59.5231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itHIIydVzZrvmm16uYZ2o030Uq0UCPyzYpgiDXU4lSioJhNTyyeU35KZTZKd4P8xiSHXMvyrQGhtJQ+gGRIZqe/+zgEtxrkpUVFSPLKqGfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=835 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210121
X-Proofpoint-ORIG-GUID: KnPgevIAYrwuwPA-vgTz-taLMqRTDTAx
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=687e4207 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=8IIpikOTnNMruie5TPsA:9 cc=ntf awl=host:13600
X-Proofpoint-GUID: KnPgevIAYrwuwPA-vgTz-taLMqRTDTAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEyMSBTYWx0ZWRfX4YAlf0lUoQi5
 z7V5VEz4ToN0qgEZ+vuWM+cT2QeArakeAs1/M9bc/c8xj/+6sGTKHpfTSyLBWh8ya3zVCykSDQA
 tjoVccYsDQ0sZXcKHjiV/lYVt98y16nYLCbLm38Mvzoty25Mc+k3/Xdbht5fIstOZoJnHuQWusP
 c1YWU2/eMhiPk/RD9gatFcTLp7NRUh3J62ndgs14Cft0PvBZKKyDUU+GrxFsZ+quHUejGDq6YRo
 K8/KyAAcr5hT42sNFvwEwt20QyiEAl9XFi5mRyPs+nXSrR/ETIqbFgaYlfiUhB24Z3jxeEND6Mb
 tp2uJmk82vXB5pcHlUBP2g1XyRXc7PWFI3BvtMJlz6YJjUaSS5Z8E/sYKhWzsGv8RV22POE9k4k
 prQGZkbcpmxssC+cGI1sHfDuWeJXEsIVT3zjCjVAzqAfqbwpFnqRjrAk087rqG2RcIf9iKIy

It is better to use explicit module`symbol references in dlibs so as
to avoid loading modules needlessly.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dlibs/aarch64/5.11/io.d | 2 +-
 dlibs/aarch64/5.12/io.d | 2 +-
 dlibs/aarch64/5.14/io.d | 2 +-
 dlibs/aarch64/5.16/io.d | 2 +-
 dlibs/aarch64/5.2/io.d  | 2 +-
 dlibs/aarch64/5.6/io.d  | 2 +-
 dlibs/aarch64/6.1/io.d  | 2 +-
 dlibs/aarch64/6.10/io.d | 2 +-
 dlibs/x86_64/5.11/io.d  | 2 +-
 dlibs/x86_64/5.12/io.d  | 2 +-
 dlibs/x86_64/5.14/io.d  | 2 +-
 dlibs/x86_64/5.16/io.d  | 2 +-
 dlibs/x86_64/5.2/io.d   | 2 +-
 dlibs/x86_64/5.6/io.d   | 2 +-
 dlibs/x86_64/6.1/io.d   | 2 +-
 dlibs/x86_64/6.10/io.d  | 2 +-
 libdtrace/io.d.in       | 8 ++++----
 17 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/dlibs/aarch64/5.11/io.d b/dlibs/aarch64/5.11/io.d
index c153d5a2..c968a7d3 100644
--- a/dlibs/aarch64/5.11/io.d
+++ b/dlibs/aarch64/5.11/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/aarch64/5.12/io.d b/dlibs/aarch64/5.12/io.d
index 09968d5a..6f60ae05 100644
--- a/dlibs/aarch64/5.12/io.d
+++ b/dlibs/aarch64/5.12/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/aarch64/5.14/io.d b/dlibs/aarch64/5.14/io.d
index 09968d5a..6f60ae05 100644
--- a/dlibs/aarch64/5.14/io.d
+++ b/dlibs/aarch64/5.14/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/aarch64/5.16/io.d b/dlibs/aarch64/5.16/io.d
index 09968d5a..6f60ae05 100644
--- a/dlibs/aarch64/5.16/io.d
+++ b/dlibs/aarch64/5.16/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/aarch64/5.2/io.d b/dlibs/aarch64/5.2/io.d
index 5111df28..10666806 100644
--- a/dlibs/aarch64/5.2/io.d
+++ b/dlibs/aarch64/5.2/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/aarch64/5.6/io.d b/dlibs/aarch64/5.6/io.d
index 5111df28..10666806 100644
--- a/dlibs/aarch64/5.6/io.d
+++ b/dlibs/aarch64/5.6/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/aarch64/6.1/io.d b/dlibs/aarch64/6.1/io.d
index 09968d5a..6f60ae05 100644
--- a/dlibs/aarch64/6.1/io.d
+++ b/dlibs/aarch64/6.1/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/aarch64/6.10/io.d b/dlibs/aarch64/6.10/io.d
index a1458d6f..45e7aa63 100644
--- a/dlibs/aarch64/6.10/io.d
+++ b/dlibs/aarch64/6.10/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.11/io.d b/dlibs/x86_64/5.11/io.d
index ae4b62c3..b9f33433 100644
--- a/dlibs/x86_64/5.11/io.d
+++ b/dlibs/x86_64/5.11/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.12/io.d b/dlibs/x86_64/5.12/io.d
index 0432b02c..7ce005f9 100644
--- a/dlibs/x86_64/5.12/io.d
+++ b/dlibs/x86_64/5.12/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.14/io.d b/dlibs/x86_64/5.14/io.d
index 0432b02c..7ce005f9 100644
--- a/dlibs/x86_64/5.14/io.d
+++ b/dlibs/x86_64/5.14/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.16/io.d b/dlibs/x86_64/5.16/io.d
index 0432b02c..7ce005f9 100644
--- a/dlibs/x86_64/5.16/io.d
+++ b/dlibs/x86_64/5.16/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.2/io.d b/dlibs/x86_64/5.2/io.d
index 415bbb4c..d2af79c8 100644
--- a/dlibs/x86_64/5.2/io.d
+++ b/dlibs/x86_64/5.2/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.6/io.d b/dlibs/x86_64/5.6/io.d
index 415bbb4c..d2af79c8 100644
--- a/dlibs/x86_64/5.6/io.d
+++ b/dlibs/x86_64/5.6/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/x86_64/6.1/io.d b/dlibs/x86_64/6.1/io.d
index 0432b02c..7ce005f9 100644
--- a/dlibs/x86_64/6.1/io.d
+++ b/dlibs/x86_64/6.1/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/x86_64/6.10/io.d b/dlibs/x86_64/6.10/io.d
index 92704839..716727ce 100644
--- a/dlibs/x86_64/6.10/io.d
+++ b/dlibs/x86_64/6.10/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)&`major_names)[
+			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/libdtrace/io.d.in b/libdtrace/io.d.in
index 6d43444a..a869ddae 100644
--- a/libdtrace/io.d.in
+++ b/libdtrace/io.d.in
@@ -130,10 +130,10 @@ translator devinfo_t < struct bio *B > {
 	dev_minor = B->__disk_chk == NULL ? 0 : getminor(B->__bio_part_dev);
 	dev_instance = 0;
 	dev_name = B->__disk_chk == NULL
-			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
-					getmajor(B->__bio_part_dev) % 255
-				   ]->name);
+		? "nfs"
+		: stringof(((struct blk_major_name **)vmlinux`major_names)[
+				getmajor(B->__bio_part_dev) % 255
+			   ]->name);
 	dev_statname = B->__disk_chk == NULL ? "nfs" :
 	    (B->__bio_partno) == 0 ? stringof(B->__disk->disk_name) :
 	    strjoin(stringof(B->__disk->disk_name), lltostr(B->__bio_partno));
-- 
2.45.2

