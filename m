Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759C7221FB6
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532602; cv=fail; b=B4nrquMTVLaxUEqp8kPOSWU/cW9nLqrN+IBGvCtXcFbSo33LNU0Qt1UuLqZrXUMx4I3TSXYsJMXVJrPkpFrz0i2Rp1xbRQ+KRCZDKqFWvA8hbR1j43K5I5hrU8HAuxmC+dmdwCdfVRi6aCB8yklvfX+iI5lCZpV016XJi9zamw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532602; c=relaxed/simple;
	bh=tdgSWSXHx7Z5lfWk6th/ujLzr7F2NtHsEbyjeU+9FKs=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Gcu0Hc4ZfbCtSiKETpGnUtYtDnXPRmpzFg8/vjQXUqRtoXtfHUdDgxZ06xQmAbywrf69Hpgrqrvg1QbEfBrNGOx78R4Mjd/tlpbv7L5woNDLVcFL8HUK3w7W/3lIodJRyvV8D+nlJHHtRfaVhDO3/eubuGhyPE4j0QmNgPAeuuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fFv09KRw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ezr3cRrZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fFv09KRw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ezr3cRrZ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBEKfZ4055921
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=vevQXBWw2YXCgQb2WTF4ST65wT/PGgyBo/W0k4UacPI=; b=
	fFv09KRwKy+ZDX6nk63wc2HXuue3r+lRxjrUdGKyiGO7L7cZPAFfyBR6BW803oCO
	pdJSdVjm19Zy5QnD4CENp6HCJj+vfY17wktl/4X9UrPXQl8ArD78H0Bq79cjME4v
	A1iBTjv1VPiCVUhPXnBDa8LRjPe2pT61bv0tT8bWtuR+dnszpTUL/m+93dqykOh9
	Yf06D2ROuvMkeMSauDsaZ8v+xZPusCSAjr7NEW/RPugXPJmKA8sA5EV4NsV0u0dn
	H8qIRWyVmIUfpjL76jLCDRuhYEhoahkkDzyEgpT8yLLMQKYgfBSgO52XwkmXJP7a
	0CVB/ixrf97L7zaeOJQaCw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvnpscbx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:49:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RFl7Qv035370
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:49:58 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013010.outbound.protection.outlook.com [40.107.201.10])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh9nya0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:49:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWmWRQ0ud109zFq7CLjAnYzXExQKZBwc7VlqwUzemICuWp1K0enarNNdnZ3NSZnELafN2ydzsfiP1639kYqkgm2sRhqHUFLM5B0Y1XjfaPk8bKpQSmtlOZS8v9hbEkc8bAn881TJZHdUDpAChsUpw07JZsvLKtOrAN8Qmy1QhOBRSDl4+AEEjlkLAqtbUCH6XMPfhFQzT9jAVR4mutBOlfYS7QJEQFQTARE3Qs5ffFDqxuxlHrDFJiO9wNEvsF1jPU6hK53FS4zIfGJ7vTWWLEiYV+WoIYsGYX9rM6AiueR+Q1VBuFaxmltbpRa+5krqN+4WE5ExhgQe4PepoARTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vevQXBWw2YXCgQb2WTF4ST65wT/PGgyBo/W0k4UacPI=;
 b=FNTbMVJKpJlGyuN+6+HAoEiY1RJfEAt0GYmdTwIbpFps7Bt/L3dUnC6Q5ml7xyl1fQX7jV8NmAPGfVhrqS1droDW4BnezG7z3TODjvREQv/Ky7aZZWiJ+Tke9qCMjOZmTQ/3SwIbENlV2X4ImNvfUzlrlKeKqlf5x72M/2MjoGZZW6YEK5Av8y05IoJnCuDn4KpmE5WzItqXphRov6ce/TT62n+Aot6Nht4FE54WBzO/WVcm/lZNYFmHs0SCgcbqhfm5HI8/CgL/yKo9lB+IeiiC101rrQ99FDFKK33FBg+XJk5q1/lx/4J7JPmgFCI3brxL54KiBdwvzWMOXjYGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vevQXBWw2YXCgQb2WTF4ST65wT/PGgyBo/W0k4UacPI=;
 b=Ezr3cRrZ849mDcnq89xIgT0NjCUexXM8tjYu0pNgYpnm1EmSzJHwkKVhpxrQLU0luUG0YGFWOStf2TcDfa1e17TELKHiZy/fzhfkErsNUYXNor22/u0WFtO5ep0J8JPrRjoPEWZHKdDaKnX9CIaDLvXqf4gnfeajZMkXpamJn/0=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by LV0PR10MB997614.namprd10.prod.outlook.com (2603:10b6:408:33d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 16:49:55 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 16:49:55 +0000
Date: Tue, 27 Jan 2026 11:49:54 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Revert "Support deeper version numbers (e.g. 2.0.4.x)"
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB75229AC7BDFA45F9DC19A2C3C290A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|LV0PR10MB997614:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7467b7-2d4e-47ed-560e-08de5dc4194e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HZ5tsDwJyRpv00whZuMVKgM32Y0G4LS3zI7BskHAynKPXuXSclfelu2pOUh6?=
 =?us-ascii?Q?yvTH1jeonRY/gYNEnW52yBjpyp/n91gtZGpWIjf50slzPTacKbC3SL0JlDWc?=
 =?us-ascii?Q?GRqSo+re/314dxKqUmpbVgLg7EXOmCyyAmWBtNjaktqlwD/GPRsfZ97F+un1?=
 =?us-ascii?Q?8fg0n7YEkKdtOlffGJhOg94VC37qKX8ebEhe6Ss76twiuGxjz88AstaUGoiC?=
 =?us-ascii?Q?89uxSZbsZt7OokPpCQP6oAu33r6OUEWryDvQR0+/HZIW036X8hp9LEUXDcYd?=
 =?us-ascii?Q?mQJeDuK296UnbEYjTJNAx3ZPTyk/PJZwNgOU89Wnns9zuCahMyGmbv8niTMv?=
 =?us-ascii?Q?Bmu2fS/jXOrdmceFXgRsQ316lmTznaUCTnH7GvkqZw3SqNgw4zqJKE+3ONm9?=
 =?us-ascii?Q?UnZ0/aeQ7o2/vJ5WbTEZpr5czoI/tfAq2UpcC9xQKbcJvVWIGQMQ6ab+uawQ?=
 =?us-ascii?Q?Sd9G/fp0YS2uS55sMjfNPZO46yF4bVwFym0TkZYrN7gVuAFZB69V4qUKEExd?=
 =?us-ascii?Q?ZjC83nAiWdWon8EEaD5p9EH/2wwb7Qv3Kz/jlRDYOdqOogJJ/1LY31w6FVAs?=
 =?us-ascii?Q?8kkVYZDOxfySnINt9ogHen7+mua0TA7kFdNjp4SOjbpqP3bml0IGSk7DajNu?=
 =?us-ascii?Q?jx2rzHP0idFzCBoI2vGjPh982qZFMXstqKOS9HoYSceO3qBBGG+PwgWE9Pv7?=
 =?us-ascii?Q?iCCStINtEGN6i8aWD2xeDhgVbqgEBp7in2GL6pQdf3s6e++/2JJgRdQroKGu?=
 =?us-ascii?Q?wbERRrNGIcjI65xK9RBSegwxMfdRp8/ozwwhJWWxBRquqqFtZfgIS/w1qzZI?=
 =?us-ascii?Q?wMPveIBjygM0DVSpZkhllhcGKfad+SyLFjwO7X94wQNYgCegTutfsXDXeC0J?=
 =?us-ascii?Q?+dXQHnb5EfQfMLGx0q34omM3XNWnez2V3PbCcbS4RC+RaB9BIDAmUOQ0XYcA?=
 =?us-ascii?Q?Y+JEivSih+1+0wTU5pdBCXzktirSmZ42pl/PpIhSL+PMwf8SGMTuv0TP7Zwz?=
 =?us-ascii?Q?Udud/Ef7ydZsWxdVZYbp0slbsTYsgsG2gLxeCVPhE9LuBNCI+1nqeeFAPuEX?=
 =?us-ascii?Q?3v6lhDnRXxlHcCa+TDdVUi5qa+LUr3lNReIVAL0gg3PfbpWL+nPjmPXShOki?=
 =?us-ascii?Q?z/Iml+ejEog82EKSCax/G0IzN7QgZOi0k3RIcrUuDqb9zT+C/ttplJIOmfCv?=
 =?us-ascii?Q?0CNHc0kC/KIZTjKzZnwBCap5rz0eF6i4a4ka/Bkc4QuDCg1eS3aws1+WNeH7?=
 =?us-ascii?Q?H0qfsx2bCFySifSs6x7isDxNGLRgrntfW+eM7fFM2ks2q0227zPHV2nSwQ9+?=
 =?us-ascii?Q?1+KEOGEmIGs7WxVp5Qc0j+a0Yb7bgmnDjkkg8H8NjtZEQmVixDMjh/QwTU/u?=
 =?us-ascii?Q?i7ymXY/lqFP8KFHay0ng36+XJ7Of4pS+vVv7r8Q9s5L4RkQ4GQVF0lggLaZ/?=
 =?us-ascii?Q?UeMqE1zeQQgsdIwXBJJEivaeNoyq/3RlYlsJXg/H0YAYmrEPQHaJ/yjr6zdn?=
 =?us-ascii?Q?YuAkOQAAYhjpuOxj0V8xJHLfSoENLwwUCbtXZcoqRB+nIoSXlbtdHmZLuwgu?=
 =?us-ascii?Q?x/y29wFnK7UJIFtqL6I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FsVElNan8Kajg3mXMIqN2YQIpQkHZKKvFCJJTAifLqly7anqdNE0ufPSTA4w?=
 =?us-ascii?Q?btNbH9K0/gSwXsA56CewcAG77j/g/dIU8bWO1lLU8fjEoNacYqAygJWwdWn2?=
 =?us-ascii?Q?iTwBTiq6G2wcug9ZF+7iW9LmSPvn/Lyo7lZVsU386z9F2xq5oHfyHRiFuSNN?=
 =?us-ascii?Q?T7PuWr7kJ2p0RnLXAuOvIWqz6Kk8eIf8PdwqbDDPP32nWPZyuFsZWqBr1R5C?=
 =?us-ascii?Q?kfexmvP0E/2wtR9mn1UE61ZZumb9+Lf6UysSARhFBysaBsbJa7i0Pn1j+NgZ?=
 =?us-ascii?Q?JGrU3xBl8yjUXOSvpEgJEoi7TpJrBjBAIDxm71Uh0PkkbhD9kuLi6DcI6nKv?=
 =?us-ascii?Q?a/J+AORgvNvnUeGBxADFKoZqR/eAAl5CyaXO+r2bXjdYkuH/CL9YdVzvEGD4?=
 =?us-ascii?Q?1sTWA6H5wzXpuubEbQZdxgZsZro8fmOyp1T3O3I/3aRXqO4Csy/o1tp0uE9z?=
 =?us-ascii?Q?wzJgkHeRo9ldvmZ2lFWa39TiyhgV5Q07OuIBE2yE6mWw2E1+jti9gtCMU8Ns?=
 =?us-ascii?Q?ySlp18miWbKmeSKQndO2l9xwmAM4Nk6FPUXG9fR16gRbPZ54LU6gmn17M8ae?=
 =?us-ascii?Q?p/zAUgstp+jckeuc0uwQbspFfPFcjpXNdWxX5i+rZ0vsPMEY+rlUK+E1b/IL?=
 =?us-ascii?Q?vDLgg4PPAVNxqJWVkkQ+QVZoJTruH5gZ6dtYEkRM3EW7leeiJB1qYHyvgyXK?=
 =?us-ascii?Q?An4y2+nvVc/wBzay54pDoi+QgR8srf44egwSVrK+slItXaFRGRjq2U5RWmst?=
 =?us-ascii?Q?CWE7CfuZZ3odXgs4WqA8tj0RKZA2cQbz++Raqz3Y//qqFnKxI8xWQsa22B0H?=
 =?us-ascii?Q?BOBD2wAEozuJ1TNhUu8W2+2luUv/+WjJLRdI8DDKAtChFEzPBY6jfVjbFlrN?=
 =?us-ascii?Q?R+SxlipEN3dGeipeG09ovDy3PZKNu6ZZnJPV5e9z6Am0/C2jvBqs5ymZUOm7?=
 =?us-ascii?Q?i+rwylru3gOXBTIiEGt3So4P6gekAKW7G67qKsZFi2l5LbwJYZ3UHFwj48jj?=
 =?us-ascii?Q?1ASOWUL7YpCsJyXkJA7GWZ8SCw/M+cIKuShrQwRd/DHiiV50QeFVsxUtJ4K2?=
 =?us-ascii?Q?q0Cone5TdW7YXhCla3rIEub51hEhkm5/rBz6iBW7gZI8NJNc6fgkkclSFeuC?=
 =?us-ascii?Q?oj3KvN/JEmpY8yS2y3f1X9MlCR+myt/3rBWw/bxWfExQChAPI9Ux3j0VUq2C?=
 =?us-ascii?Q?Vhw8BXE1TCDgX8Jr/Fzk4H9TbU8TEVZntPU1cr5II3eMeYNMtt5V7t84M4/D?=
 =?us-ascii?Q?aMUNU+OEQzAUSKY1hIWKXXmv05IHb6IIJudL3Bw6/FJ4VK8tOsRwHiko3+5B?=
 =?us-ascii?Q?FOaDC/zFfE7U2Cgxnnoq8dvgRLyXUpRmhI1O6lZTqUkKwRVjzQpmfVpg5tWc?=
 =?us-ascii?Q?gH9f4mPaJYgIFtunoiSEmC2U7tzGhwx6SLRpqiA0LOxlngkxEdcJKQG7lQZF?=
 =?us-ascii?Q?spRQBdtPMo1byaVbDFYxO2VxjoTmxfCAQ8E1QP32QPPfDV+5LQWm/b2NoM7l?=
 =?us-ascii?Q?wm4Lw3Abr+HxCsUgQC/ws3e0JDlzySDHweeh7eeksaKeMcYkNLnlE1ODHIvQ?=
 =?us-ascii?Q?Re5yg5L4Po84/Ce7EBu7bB4uCzojcYx/75bthKRmm8a7SwNCC421mOE30WH4?=
 =?us-ascii?Q?tYW83bXDqsZPN5AGWDUbGtfGUWE7ylo06wMPdemwFGQCt3SZMxLF7BLor7Q2?=
 =?us-ascii?Q?uOOi7bg9YCEMtQuWrOFbd3puThMjsZsVFLwRAPRnaab2qnShq5yNFahE9gyU?=
 =?us-ascii?Q?9916a/k1rwXiIfBeR7YbK0r6oIyg0uI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kDFiZxke6FQEFPkjrvcEaAbnsBKRiy4k35spNnp+Gq349Ac69+PEI7tZtgEoRi4IAJZV13n81c3S4e1ZGjO/IupY5jTrnvye/r3+a5zZN2VgZkuyt5FJifXH41RuPNyph5Lg33OJUJirsCTs+85DCDpnA7nedU/sgP2ak7WIBOi4zyNpYGsEwGqHRyAkhU27nopSCzojAN70Yx458v7I2wFXOk/4DRXrJVo5zWTxxlGWYQBL8CvQvrtaoIda92I3oUy/5cSQVA53RPwKKbRMstzBaEbMhj+QOBZ9pLv7ktYH4zoWr8dmpe4UOE5pukAvugoH8Ds3UH4+MSoIgYTsdCSElpE5xs4yDPMW+xG8WfICJjlQlZbqg+Sb3xdwwC2i654Bm+RzbXIF7AuJV2nO6z6+jDjAslSw05g+FFDeEX2/EdPFNrgKtFAm8sNexlddZqNmUYk7/AcM2RHfUaGAk52zdBvxckrJQpM9PnWmp+6HvOXKFdTSFawx08mDQdy4vJao8kxoGL71KifaBTGN3+xP1VN99YDILvye0Iy7QPx5BmWhD5JGQ3Uor9G2Kces1Gmb4qznH+4i//2UNEmp1X6yT5CwEhKvVGgj9nIU1Uk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7467b7-2d4e-47ed-560e-08de5dc4194e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:49:55.4301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXMQJ+gAnqPAjJhBDuNRT+c7V3MGCBcriU8/Cs+1S1AbDnlEVNog0v394pQygw7cNP44fG9xqhTEH8dgRASXww56eFJnfkCI+dDLGeT2RlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997614
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601270137
X-Authority-Analysis: v=2.4 cv=dY2NHHXe c=1 sm=1 tr=0 ts=6978ecb7 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=60GHUQoNLt_MrEkNx5cA:9
X-Proofpoint-GUID: b2_oBLgn4NQ09-XBBDaiANpYCdWe520s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNyBTYWx0ZWRfX+MscJL8kzpW4
 UssMpqGNaEMkjMso0h3TQ/RKlzNrRz2STrDYPzpRSoB3cY/MSBNx7Uiu5LefGeZwZch1aNZsOh2
 e9kK7gKskfkkzW7XvZez9EVxMlN6JXbaO7G9PK6pgX7rRYCmfDoIENAVXzoDz6cZkRufiaT9MzK
 FPoU44/FBCrCkhnsluVD28WiYd1f5a6L9QwM3qF/3YoSBDVu93Wy3nugB9C6yX7PnUAromIP0Cw
 0CEdCD3BxTm2Es2O4WLa8QotXA25iX0w6rDEbDkuOezXZXLFGaBUhMfGOPSHuXQYERHdG71ZTSO
 BxKzZm3dqGVkhom/CiJ9U+a9IGhkFjZfJT+uam0nWqPlyot9BXWpGcn/xAXtoM0YQM1ug2WV4Qp
 dk+wMk8O5IvDfoK9Eu/2h3mwoq9VEddkrAXDFS/m8Lyp2VCKGUjRTwQwK/AqhawXoDxZWHjaSI0
 nxrm6KA/gf1+xd59Tyw==
X-Proofpoint-ORIG-GUID: b2_oBLgn4NQ09-XBBDaiANpYCdWe520s

This reverts commit 1898d098a582488c9de485a9b672f6b2929335ba.

The DTrace version numbering scheme only supports up to 3 digits in the
version number, and expanding this to 4 digits would require quite a lot
more changes.
---
 libdtrace/mkvers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/mkvers b/libdtrace/mkvers
index 087c0916..6f924032 100755
--- a/libdtrace/mkvers
+++ b/libdtrace/mkvers
@@ -10,7 +10,7 @@
 NF == 0 { next; }
 
 {
-	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,3}$/) == 0) {
+	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
 		print "E: Invalid version string: " $1 >"/dev/stderr";
 		exit 1
 	}
-- 
2.51.0

