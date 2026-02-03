Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920642652B6
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135818; cv=fail; b=Ks88Z+rLQBFVB5lRtam8hiMlbMET6WINFZwdCe9ZQd5Ap0YTcFULxpWVwr2jnb26aTL7ZsI0i2fUlcKeuADRT719aYe0we9g4z9fmOoR8DDJVrRgcmpFQxNFF/S/7qw4ZLkuuOOZ4K4F8oFEXAD6op1mpkoCeR3c8Yxs4wUlZW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135818; c=relaxed/simple;
	bh=LbxZ68Q5pXr57/akCP+bvYeFbrXLpM5B+K9B96SK7zY=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=TEXFlNw5Tam4v8zaN7Dvz35V8AHshQPP+XlYABn+T3quvdfuhekZgmXthS7UXjbOEzDN4CtTPAkz8eqbY6EnVWNE90fDMnoUiiuyFj9+8Nunm6w09P2JpnhKn8ZUIHh0Yt4XTK60iLNaLnpKawJT0Elr24Bi8Nzl7G1Hs3heLac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cojKOKn4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uIroiocr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cojKOKn4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uIroiocr"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Dp7Y03636100
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 16:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=+vsVF5vfDgxVlM8cCKDsILgPybuPvURTvFF3V/hwyto=; b=
	cojKOKn4EG/lpSgIGIGueSLWoavcZ5mv2Pjp0n+R6F9JdfiEwsixxkrr3f3wkHzU
	yaOAjh1t4wdSBuTwKB8QsG9EbpORaCVtiYyWual8ufzeMDSnvzLsqQWksXHsrqPJ
	VuovtC+afSO0+q6DwKnPhjqAZhBKiyPiHfHL2P0Y6zCFcveMNM8rlu9wtu69oFUw
	dzqjnuQt+0hSC1exV8lSShRlkNHJohjfzPj8sN3QGsQlk9jC5JLeBYshoPlRZ4kV
	uQJbX7X7qC+rwylRnPcxIxAHceOOoXOFK8Ug4cB1hbcJqe6svYJgRjGFq/R/C0C+
	6Tp+5SJTXkihCKtLZlt4sA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3j8uga7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 16:23:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613FZe1u002262
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 16:23:35 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186mjqf0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 16:23:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHfwlWo/9EGH5FZHy+FwVp691PmyZqFPk6Nlb8sm7EuhxJx8uOPsUaGkvs0v5QA88zo6BNGZq3pdmlQOy7byKiLezCNAATy3shWLTQj/8IZCCpsr86ztjQDq+mH8IJU1cqHTqh5bs/vBdui05PEdjlg6c1QFO/zHOgjxRxELk5/sF7ULeumNi8CgIddHRL8HE2xizkqQzVraXaG/Bqzn3NXI2F04qm56nM/ZOSOwcGJ3362cO+oVDj4bFGy5XQ3YJbPalj1yzce4hof0q4p7qcUfcPAAjBq9n8l13sQUpL6ED6vn2oC+hEn4qjIDOWhnPxc0knJDDCTrwQlEYHoIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vsVF5vfDgxVlM8cCKDsILgPybuPvURTvFF3V/hwyto=;
 b=BsyBel5hXU42bzGnhIGvfZeeuVZRyR1ocZ0AjNRlRgCWTzFwlXRjZ5VikpCArj9whcmB012UxAyRCQcPFRu5UJ3EvSTdFS+zNl8Wrc5zdSOqHcFYgtspmFMN4vsgl9W/5yZ4PpbplWvC/a0f4dN4lzNzPWOavbgCy7uAEX1G1SpKpFEDIBn4wWO5wWdB8MUFOlS4jnW4SDw7jKGjRqIG0YmZUwiTyANpC6LvuAOxeaD6KOlvYHeSKh9f8zyidFc6lOfko9KIKxkQHHqpndoePjJgeEFAlMo7oZezWf3aR41w40MR6RTd+O52EKZpFajjoVNQgGDoAw7vu9hj9XFkHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vsVF5vfDgxVlM8cCKDsILgPybuPvURTvFF3V/hwyto=;
 b=uIroiocr/osiLiPdVGo6m7fYZjN0oujjptD/zXrBWKMiBv6h3I4SYZ0SDXfVc9fPMzucPcHYQpVqXMMfLuxdypEKftlWjdzYaI9hbGb4RRy93uRR4IpMmXK3aFTWnrpdsl2dbxGuZN+TBc24/uDUv7fRBzwyiZTOKACDpxuwU2o=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SN7PR10MB6617.namprd10.prod.outlook.com (2603:10b6:806:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:23:32 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 16:23:32 +0000
Date: Tue, 03 Feb 2026 11:23:30 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: account for member name change in mm_struct
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522C34E1C6FA098104E192CC29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SN7PR10MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e60508-626a-4d84-ad36-08de6340925f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5EHgegrFBiMRdQjbjfpUnKbT22ZEomsVH2+gnbsmx2M8puX1TKdCIPbUhTEB?=
 =?us-ascii?Q?PW5Jzg6yJjzMaFMXgc4/7O1tO0mKsAi5fHfg4ZDvs8tRjsVvhd21E0SrlIaf?=
 =?us-ascii?Q?og0oDkSIxLdtbPNl99OBIxCvxW932BoG1LgxvGiAGNhHGqZD+sjLSL4tIdTS?=
 =?us-ascii?Q?PFYAkbnto0qBiaDwlD/dIrijOwkVDeToJCXFxL22As4lqOVTNgNK/Z8t/wtS?=
 =?us-ascii?Q?x4Y/UyMMc/nSdlYPIogcaK9uVBOYgnCHTlS2tw8DxU+7Fg/sq4zyIkJ3KlP/?=
 =?us-ascii?Q?PKRce28xfY7mF43DVLxk91DVuI2GCpSh/vCKsTT1zWVTHTUqaZFfwub+vPPH?=
 =?us-ascii?Q?LSmTY8IPigfao6zs+0pGbjuuuwrWaQ86mQlZ8gffonFKVp3OabDBrbdugupB?=
 =?us-ascii?Q?OcfTdw6LJlk8e3mOaM9XbSzGjzGg7OzQDoDet5F8F1WeyLjBF7Z6lYpqBASH?=
 =?us-ascii?Q?6gSft8aidw+NsTez/f3/X+/tUHra0AFN88a/3lk2H8Q9DFNKtD0Oz0+wyT0T?=
 =?us-ascii?Q?u5Asz8hqdWGdbu7ZeNCi0tRY4YxEGL0Dit19+1LD1lVv6CRncKX3QBy9mVK3?=
 =?us-ascii?Q?mlO12Nid71B39G8tL4CGuyGikDDIxOANvywQulL0D/BtTJNPV48yMtTG8pPb?=
 =?us-ascii?Q?aNjhHeJeG1q9t6eW0P79+nxFvaeaYx8j1pNgPJF+PpFSAaHzM7EqEiXkkxuS?=
 =?us-ascii?Q?9weJtYgxB4OYr+IzkwAB8rb00GspIFoVL2ciezIzw6tfluNS15dsMk3vZ1Rh?=
 =?us-ascii?Q?6Z3tYs7mTvCwLrBmBN3sRm11tFKmz5VYNax8w0cwzFNwvgwcky10knfbAx3H?=
 =?us-ascii?Q?zs3lj9YGC3T1dQDqtqg8gJr+7/5lUelspxqPRE54tMkeljysRuMs+XF92FIG?=
 =?us-ascii?Q?W67Dp+iRUCwNqJ2UqQ6T/QNqSOY6PkRu3rc3BvGco9l5Wg5d+JUyWx/X+mZS?=
 =?us-ascii?Q?+0nrmrs6DmoooUHaLjOdpsnMSRul9eVriydjnhpBENTRyD7Dblp0qxHmNFdJ?=
 =?us-ascii?Q?h0WtwDb0m/bVGPgK4ed3sFevuWyfKl0bitcb1/J43qP5z3Ugry2+gQqUo79O?=
 =?us-ascii?Q?AbnwmjkKRgoqwDY3pbTtsAORykRdTK0iNp8+SjsGOPMrgLTDQDSGnVagsrLn?=
 =?us-ascii?Q?Y0ZTdlwOU4ppwpxPGutxcEXhKZThK3VNbT1Ije3Vgk5SpFI+Fg2AVvD9TzQs?=
 =?us-ascii?Q?T2OoHVoRJdULDJ3OepVWJxU4i9Td5jZgvRjxk3ghxHVIQXXMnuVGLT51kXlS?=
 =?us-ascii?Q?Vqi7YUibl1dk985l4h9iRdOLcJ5LwIiRGMZwiavduIdAVw86DPFpqRe1zYDY?=
 =?us-ascii?Q?m4hcMD7r+QJGKW/g++XtO8ylaXpouEYsg8sjAuIw3SrBq7JTj15/2117pfns?=
 =?us-ascii?Q?uYROBdTTmvCVqRczTzHeneEeLyZzggfROImcASRCe44nQ8rJi2EftHqhdtEo?=
 =?us-ascii?Q?Rcrvt6sek2WHPVmHdKpO0YApk9/fpEwslU9H4qgmst8u8hwTXmHB5nE1gMv+?=
 =?us-ascii?Q?s4xSYWLICH+MsgBKZzGARtGVU1gyH+OeRxlvn7l7EBtRBBiQvWyhL6BL2nZR?=
 =?us-ascii?Q?cx7oXb8h9Y7L7Rb5FzI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DGbd05Jz0aQNRgaCYlJHbLPhuKBbLScxMfUBlsUvv1n+PjHPLQT7eX99WwJN?=
 =?us-ascii?Q?pdgfGZovOnwxkd8rZFSUjktsrBf5UuzjjZ6grAqXh3qqwMDLqADFHHQwoWvb?=
 =?us-ascii?Q?1BcAGYE9KGqxeuj0qKz3kU/bKS4FLX1de71Zp+LjmwXXkmoUnqOcxlGurrZ5?=
 =?us-ascii?Q?dn6YUQ/9yc2lSTa8XaCDr2l7jbRHpGTN19vTIg8lF1lWipi41u/qtD4mAwfC?=
 =?us-ascii?Q?VldF4kTMtkUXVvn/9mgMq/DiPE+9kJZ7sfbb1WOoSqJHvuVpOGI5kOhAy5eo?=
 =?us-ascii?Q?rnVHmOIpSi+D1197xK/REWt6LCzvrwLk/AbhrBDeQANE2hEnWmwvQY3FCeTt?=
 =?us-ascii?Q?6XwWIfaXAtq00NUdwZvQlcD7QGVCd1RA4BXmvLc6rtQoz1xjBf0diM3MYG/d?=
 =?us-ascii?Q?Ne+W+unqbEjyOvHd8gSYAI9Imjy87pDba0iq9jql2Evc79G7OrIRBk28AeVh?=
 =?us-ascii?Q?fmk+evOkK6BuDqEqPWT/1kDKXzcvZCRFv9eXUC3iWUmz84tjcH1Rd2yvR7ih?=
 =?us-ascii?Q?d40tBAjqlxtjtsXsLuAiW96XAxmwdmH424BveLrTIM1dI1cAN1+L/yPKeDM9?=
 =?us-ascii?Q?JbMP1/cAb2z5sdM1sTcgJ3yqy9UL1WjO68BMwRrbsJJRYRMlycpNtFiUHgGI?=
 =?us-ascii?Q?R3F/e3g3VYQx6g2vIbJqPZoZ5PxEFGD5FiK0NkNkZk3JrIpWzqPD1hbVaWKH?=
 =?us-ascii?Q?uRCFxfaWZJYxX7oycvT3mzxlbm3/0q5CJHoXvUydgzXSHhdjYa27uJPCcC/y?=
 =?us-ascii?Q?Rv2KVj3yvimeXnQODz8E6iCfgC3sApfUxfToLFNl/hkCQxeZMxff3N3e8hNL?=
 =?us-ascii?Q?yI4rnVcDgVwUfounTfSypFoyTd+FyW0ZYpInf3NA7wVo10wJz8x+dJ3dDnmN?=
 =?us-ascii?Q?CDms5EQhtfd78tv5HL7wSCfLLsHoYWQNQao7dbwUyb8B+xj/6Ld3kRZ2x8/r?=
 =?us-ascii?Q?nn/MPgjEyqpMXXo3fI9hdgh/I3Aaa2HxCabY1y/81bvJuWvunwo94YXkA+lD?=
 =?us-ascii?Q?AZjzX1ghHqoSQn7A4v9iJ1iQRypcQ4iSzH5fkGrqnvyHWWIVFlYeVUNyaYAO?=
 =?us-ascii?Q?OhQ5JmEKpp7puaqDiallzw4bfx7j/Wio5JjTKXrnqeCcInI/GKbF7FKUTGp0?=
 =?us-ascii?Q?yQgmtC0veNlRs4oBbLkk1Z1ORxZBlrOZDhECNbdJ3DrbzLAUKtsn0xXiAm5t?=
 =?us-ascii?Q?snzQNydrEVFUE8ovMPZPO9K5rIE/9JY6ebOaSgQKLqk+wSLXfL6fATEqYQWO?=
 =?us-ascii?Q?7TQDOMvg4vfaV5jSsFURY+gTqBNJnl5tFQgsbyCxOr3ffDdgLaU2L8Ku30Fn?=
 =?us-ascii?Q?Xp/bu1Cyaqg1jiszBgJXkS6wuXY1gaLn0txLtLfGzB/jG2+qHBFZlKxtut1e?=
 =?us-ascii?Q?N8Xwjost2ziD4XcEstF8/MpBG2tgbnjBYGh2LUPaSaZrmAeDitFXmD5KarvL?=
 =?us-ascii?Q?aMq8MymR9Z5eQCvWb5dH/Q8q1MMe1g4mh17ddVk4CDw1aY3mwNAppQ7cRxHN?=
 =?us-ascii?Q?vhp/jb4e7S7JjHntzwpvOoNoIi5vjPag6Fa2AOU3Q3WCQ4l6RWKas187bLng?=
 =?us-ascii?Q?AM2+SCSLIAD4gr1T2xsLTZ92WWLPAL5kK38t92riJVd6uUjPaLN5eeYf1Wqt?=
 =?us-ascii?Q?zZVEbhFfbwHujLEJgccIRmT4ebM7NKzJUgz43LvZCyVIaf4bWQIqY7bu092+?=
 =?us-ascii?Q?w4Sw7knjYo11MZ4HFIszJZfdkE4k7d9gjNgFEkeIdn+oDMXLvaBZLMBktonK?=
 =?us-ascii?Q?O43V2XaCxQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WfzrHg4hCqAmVayvYPL414qkE1pbdYlx57TF7/B2xeUih7bIGXJmBXVefhgvI29jIyb27NLEzm7ZT0CeLgcyHgxXCJ/8r8AecswngMibUG4aCKK5IEBd0S2/lvgByvG2pn2BBWhOswTeXRziYFdN4aKXNWobDiqQjV4uAHBIaf9Lmrh1bJQi4qhAtgvnlpP29UeAwhGk7+spWe57YkZhvkbBxvW6/GeWZVDVjdwK+tedl+5X8Wa7dnDd6BDEexgZK/U3UxJcCb9j8h3A1tLVy4+aChRe9BlrHWAoZ3F1d+eDl6xgg3/UD9vDfz2/FSW1k/RXEuiNKapf8b6gtZ0N+NzV1h3eX+Uox7TE4W8+hRM1zIBmOSRIo814wugmBtMg6UbIUiuaLz10KJel3YEXM90vMffR0e2buy3liX8OyAfP5+itS1yVlUvT2HGMnJt7btNAwLxhrcveyRCQy+L0F3LHUH3tUS248ADrNaj+ndJ1CghLlAb5sfpwFbpar4dprtBI9kC52MyeESVpS0B2v6HTC6nqB/ZgnEPaWNdLnv7tVG5n7UlVphcBCU4Me+yM/6l3cB1y+9DZrRDWtqq+DKyU2QF6CPQW8Rg5nh7qK18=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e60508-626a-4d84-ad36-08de6340925f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:23:31.9026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9kBf7BaX5mULlGPd2ggkZU4t+En7OTryxgBuW+/dEAXEUCFhu2gkgF4rp3xppAQsxLRnZTa0/0PDhqYDLwNIDBsUakZp54himMQ/2pl1mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6617
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030131
X-Proofpoint-GUID: 2_adAwo__A7WYQ7xcPH89L6gBUlljJPP
X-Proofpoint-ORIG-GUID: 2_adAwo__A7WYQ7xcPH89L6gBUlljJPP
X-Authority-Analysis: v=2.4 cv=BJS+bVQG c=1 sm=1 tr=0 ts=69822108 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=eXpHH4PNQhkuFDgJz9sA:9 cc=ntf awl=host:12104
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEzMCBTYWx0ZWRfX65mxLDPENLdF
 kZp4hSGbJPt/JueYFBVv9b3fcrYMP6Gt8w34M3aNXNPcHW+L+i9+RRy1BSt/0HHuQvXY5hYgDY/
 +qS0PuliLFiw18S49mAJBULOxe8TO8uujkAXidru6z8nksBlUtB7k2yPfQeXyiYxoRl3q4PdDYt
 2bEmvmwL9+apLAzJ4yR7OEkDMzutTXpl/l79aeSkQCuc1XwagCb1yOsmW11krJrqtYdGpp8GrMf
 04IYhcxF6Mv7HJ6Sa4yVvzUDxMyHVVaKM3Z4aJX4vHr8WhRHCo0Qc2GUT0UYU68WS0Eiqt2ld6B
 bfWKe6DprWsuLzsmpWuypWI06LvxhYZHwSdgwqYHZNGqGJAhTcryxCZupF2wcLD8f5jYc6UZ3gp
 n9LJfxBU1zM692NNjTdYROyyg6KchXQIq1hWll6+4hthHwWCQFTDqy/7OE4BOarSQ0cBTR+Eu7V
 wXEE3Uj5gb+r/rvhEv/W8WNjNincaPiqvoeYoud8=

mm_struct->cpu_bitmap has been renamed mm_struct->flexible_array

Add support for both variants.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 ....d => tst.ctf-dynsized-bounds-runtime-1.d} |  0
 .../tst.ctf-dynsized-bounds-runtime-1.x       | 17 +++++++++++++
 .../tst.ctf-dynsized-bounds-runtime-2.d       | 25 +++++++++++++++++++
 .../tst.ctf-dynsized-bounds-runtime-2.x       | 17 +++++++++++++
 4 files changed, 59 insertions(+)
 rename test/unittest/arrays/{tst.ctf-dynsized-bounds-runtime.d => tst.ctf-dynsized-bounds-runtime-1.d} (100%)
 create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x
 create mode 100644 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d
 create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x

diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.d
similarity index 100%
rename from test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
rename to test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.d
diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x
new file mode 100755
index 00000000..264fa150
--- /dev/null
+++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x
@@ -0,0 +1,17 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# Skip this test if mm_struct does not have a cpu_bitmap member.
+
+type_id=`bpftool btf dump id 1 | \
+		awk '/\047mm_struct\047/ { print int(substr($1, 2)); }'`
+
+if bpftool btf dump id 1 root_id ${type_id} | grep "'cpu_bitmap'" &>/dev/null; then
+	exit 0
+fi
+
+exit 2
diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d
new file mode 100644
index 00000000..5e296d60
--- /dev/null
+++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
+ *	      (ensuring the bounds checking is also bypassed at runtime).
+ *
+ * SECTION: Pointers and Arrays/Array Declarations and Storage
+ */
+
+BEGIN
+{
+	i = pid - pid;			/* Non-constant 0 value. */
+	trace(curthread->mm->flexible_array[i]);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x
new file mode 100755
index 00000000..17aa06df
--- /dev/null
+++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x
@@ -0,0 +1,17 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# Skip this test if mm_struct does not have a flexible_array member.
+
+type_id=`bpftool btf dump id 1 | \
+		awk '/\047mm_struct\047/ { print int(substr($1, 2)); }'`
+
+if bpftool btf dump id 1 root_id ${type_id} | grep "'flexible_array'" &>/dev/null; then
+	exit 0
+fi
+
+exit 2
-- 
2.51.0

