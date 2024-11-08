Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269B61AA1F9
	for <dtrace@lists.linux.dev>; Fri,  8 Nov 2024 21:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731100332; cv=fail; b=H1LCe05oArtzD2VkBlMQ7w2LdkSO6oCQi4b8Bze2bAtewK/w4MqwUByFBSqXnZribMGt6Vnq6iN8wSsylIU7bMk7LJHwks4xidf2rJEIEpm83IdN6QrfpZWAYSNjgQcFBlnZj57YpNRcgdl35sp+C1yF6N9DISW5pNrPd3DXHFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731100332; c=relaxed/simple;
	bh=GTzArhrEhtIJgZrWgPd5ZNEWNP7kESabaNL+wrmh5uo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tBuLyseJLa02JHOg919c7peSBMwqX5iDilLgiEZUFL9rbohz0gSjSuiQydVRS0R4P5muFhh4eZOYtVIjtKbtMXOOcaIW7sRvjMa3vI0dlf3r9u1aAZwfx59nik9RSyqr28i6dw9Z+QsM+yCIN4zbXkquXETV9DOR9j4E9ECAOls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vo1BEURu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SJ720AYe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vo1BEURu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SJ720AYe"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8FtZlk014776
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 21:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=/InokI09o0cTULd4
	b4jM7UPZYoXn0+B+0tS2PTGVnPc=; b=Vo1BEURudJFIsZQduo6l9hzbz0wU78Ls
	GOLqdrzXBgMkLd5xC3naCZpwuxcNmjXaNnzhGKbnvGeoweOJx1Su+lNDe3QMypS5
	P42eV8nb9LCFelN/xItMPmut3bYgZoa1TKH0JhIzXpClroKlH1E8K6QEeqfHor6l
	w9nm5pzogQYarDs77vIdnC+S5RqvhBypdx9NCwML+zORqxuTy8c9DROOUnuXuQ+1
	oU3kldC5Z/V6xEqErJM9E8iPKAxscKRq5gany/U/Fvginb/QSMCBie0vMgplkI50
	NysGFEpNfT4XwMg3K/rUZrKvbb/wGtfddydPHXy4+OP5WI4h/AGREA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42s6ggtdsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 21:12:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8L0Wkj036073
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 21:12:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahc4um8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 21:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COyrgN0F47GYd6UP036LFGPlixImqcBK8A1v2spkHJ/97YIIEtL0L1Z3YgE23XfxC9DBPVq/bTwEZ6vpXnqHl2qLUEAVq4SZTdzbVUB4Qip1DgPKxQgXeEyaCGgpCg7JK27aikl9nsS1qUT5t9anE7UOuN8NJytAv4HP78Txx8AMBZTIyBceXcY/yKA0tiFd+y7r4vZqTu2LDu62Lrn/mnfk6zk6NRz+gtTPXj0u9isLX72JaCZgVHrEq5B8az/EhqmYCvsSi4+Pz+T1ZD5/lTBm9FXa+9y6JofAIIAXAyF34AXyMlf46zWquaab/pgZ2nRosyFFLXIJr+HYWzXjlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/InokI09o0cTULd4b4jM7UPZYoXn0+B+0tS2PTGVnPc=;
 b=PZVGNSyanNRPBVfrHXwIohprdxmRAfTvSNeg9AAuwRAhpkUPwZ9ZSh0QExKLdzwd1FqgcxoBYrpZUc8dzSUqlrVYlR060tnndLcX2U1tK7OcxRAGrHBJ3YwYW3eUQAUd3XNtYtQocX02Wca0tdlbacFdQQ0Wc3K3skbF5S1U/TMOGi6Ro2pEkucWMm5LS6CIKlDlEihKwlshjskMWe5g6fNwdgfoGs8ruN+jMmeLixornU7XJvCbRfhsoQW0amh0rgaSwyLTWJgA1EMqOiZ4G/xtFhbm6ZNIob+6dV0L67VFdwz7PWBkGCVygVALbKyqdVN4X1ozv72ydZZt8Aa0ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/InokI09o0cTULd4b4jM7UPZYoXn0+B+0tS2PTGVnPc=;
 b=SJ720AYealD8NTioRwzkoXO6dXjXLsJbFxTMK4p0xu9VoysYB6gr/GDyCWkMZDBG6Re14k2tm5chpBq1qR7GQm/yVnkwkWw6NKYhhybmgBq9NvYYLLUPxhXzIodL0zXO2YPJe/IMklwFyo9QMd9Hy2U+9TzyijPUy5ZuGQ2yGcI=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SN7PR10MB7046.namprd10.prod.outlook.com (2603:10b6:806:346::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 21:12:05 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 21:12:05 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] tests: repair accidentally deleted tst.pidprobes.sh
Date: Fri,  8 Nov 2024 21:12:00 +0000
Message-ID: <20241108211200.457663-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SN7PR10MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d9b676-29fe-4a91-91c0-08dd0039ff39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eftbdNvOewR0I49dbEQw8hDxaTMFVO3HmWfv9ISA8NEVnCo59GfhmpVS6w3r?=
 =?us-ascii?Q?OnxZj/ICDsk7SMhTcHtTgtzJ13Wn4RXio2ED2OGg32TwfGS9abtP0paApOsj?=
 =?us-ascii?Q?IuOfmB5j+srLD2linXDhJwt1V7ijCrjGwr0a8m8NMRenGwNBB0kJhppcAloC?=
 =?us-ascii?Q?wNzziIZPU2TsDDuDlOxgJ8MUTdVNz5HaEb83TIsHq4+sZyOO9A3PBRhg7g4D?=
 =?us-ascii?Q?N2BEJyQqIsyd0zAHvffHyy1xGMZv4w9wg+KWC6SlJc6vbCo3aj54EWhLeLw/?=
 =?us-ascii?Q?BmHvL6UYDC70Bgya9fj0Lu5N/TKMtqV3w9yaej3lUzHSc3S2rc6ZZn59GtqZ?=
 =?us-ascii?Q?D1no+CMjTmipMf7Q64T1A6A6rZlqSakmiZzQvA6uxzfx95opt6xvDUlHTlQF?=
 =?us-ascii?Q?a4OF7LSVq2b1qi8DDdv6RJNcF9r/eDUCFHxBlcAQQXvuq7fK/C+5BWdP1QUh?=
 =?us-ascii?Q?8NY4JMPUN5TWfnIZ3crHUyaePMK2nSD1FX+j4Q0bqKa8PUYgH4/i8otMJVYV?=
 =?us-ascii?Q?YuyoxrWgt0XwNCKuUDQKqdorEckOPaSGUj/W5zfjxOG6dnJu1TM9kuUkfpzI?=
 =?us-ascii?Q?wIhqbCV07owD+9x9o7CPPAZF5fHHGzsN8aqyMs2os93WqyzNXlqlqOw7gzmN?=
 =?us-ascii?Q?xGSU7GZpFk5KnxJBQAEHfqREHxDiTmkRY3VVs0OSVMTEJvwf7jjbx4ChAOIy?=
 =?us-ascii?Q?IDNGIVcuRH9dDsYCXbkdxOJse6yQuXpJOdOEiGnnt5IwMzayFUHExGbGUC4Q?=
 =?us-ascii?Q?iGx+pImetii6L7y4KsbIhOZPbmnQvFbnPoyeelOSwgzZks/VkYQ9Pz6TLz+e?=
 =?us-ascii?Q?y2+50LnYqiL8tVO2YmMeRusYiCr6i+eob3NitY2CVgjm9hNSql5RmMdIAJ4c?=
 =?us-ascii?Q?FnZcgIINE00gNaIIFKDqvpecPVFj4yYWApg9kvKoFhycg1sOBBybTGzrZjSZ?=
 =?us-ascii?Q?aRF7NKWmpctF8uvIlb22hcsH/D+GAjOrjd5xQfI1ducDe94HnwfX5gAwogQ+?=
 =?us-ascii?Q?GGv4q7Mgcdo5iUE/U3Gp/a4KpDg2nHMyoicR6LnSvkn2KYk3pSecByrUSegi?=
 =?us-ascii?Q?ThUyL2S+W2GZTmhh/zMtZJ0niRW1JkUxciNnAjDeMUs8gDDZEL0K+s2lxt9z?=
 =?us-ascii?Q?gA6lEpliEHuxE4NmZbc2VZzfH69cZfoMPduB5bdTgkIyT5G5RsdMH9ElFfXd?=
 =?us-ascii?Q?AOpIJOSGrBZmllu9E3LfUSjEQlBgtwmrdV3teSlcQR8sYOZQEczBgN1yK4nt?=
 =?us-ascii?Q?NjVrXVr3B002PM29z54yr0rPLSK6pQf/WEwq/Squ/triPpVpM3kxHVY3NTQ0?=
 =?us-ascii?Q?7BocieFnK4ArSDgktF0pgOx2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9heD8XrBBDjuE1gzRQl7RQYtsaD6CYQ3z1CCKKHo+XnHOYe77NY0zFqCxlf8?=
 =?us-ascii?Q?Ui6lSaxhQHvsV4ZTW+KOXDEmnu8xXF/W8JVcwE/Sb2lUU0YALaPBgU7h2c62?=
 =?us-ascii?Q?TbCaNlCmWwCdJMXnjP+0pp1mX2NtDnazZWNFvHrWzsAKWILX+PNoBj1Ytly8?=
 =?us-ascii?Q?CEaZoWtI0EaCTA+1tOz39SkA++j0R+RnwpnYXu18sXru1qa78BHqC1F44O7F?=
 =?us-ascii?Q?qh7d5s3j2vJmDnc5OzUTY0sIkuqBrpUiv/bJ4HKtcKm3Avo6UqWT+kxCDGcN?=
 =?us-ascii?Q?tvA5gp4ssMe7K2L6aIlQ0yfnK5KybAc1tMsIO91w3lyyjKxScMa7oRz/gzoV?=
 =?us-ascii?Q?BkAlY1cb6HMRsVqHq4NH1Cqtf0OTwibnsWz7CxSmsujtiuuCoSAjBHZ3dx1p?=
 =?us-ascii?Q?rpuaclnQs4F487RxmdrIoSRKtu3F4q3dwX71T0zbTxl6AElkcw3+soOLMq0i?=
 =?us-ascii?Q?+TyvuthtLvdCGPYz2cm/yGZ3O7UqhSdBq0vwFVOBHfyCJSmxnENA40QWPlKF?=
 =?us-ascii?Q?UISTlys5ocG5URKllYAnFIuiXubo4YCUAKedIjlMFCNEA44DLkhfcuP5QReP?=
 =?us-ascii?Q?oCijBkCTCiIKvN1bQGrlj+z1MmBnN+10GRFJ0mXakzj1mp+cU/6v2Uoz2MAU?=
 =?us-ascii?Q?xVZmft3stRZrjSPH+JnjdesLxDlHmTLxVC5/DbvqrnoLrAYZ6WYJ5M0mS6qo?=
 =?us-ascii?Q?hqkP4RXUcxe79u9h1LXC6QqVWVPYq75vIpFul43E1yS5rgHZ5NGaJjgrLYGI?=
 =?us-ascii?Q?RA4yPll124BoZ4fTgX100FdhTntDZlsVDF5636Nca/GpvqyoNrOAJU4ltyTa?=
 =?us-ascii?Q?FbntRAbcSEGVzBk7QY0pZVYl+bdugQJhrhk1gU4vvs4RyGcyYUDBkycqtamy?=
 =?us-ascii?Q?4dxu+U50coRjFfu80CvIVHtZUtltGhemwuHI4ZDcdaq+Ap/vwMuo1v+mnc/6?=
 =?us-ascii?Q?EnPNoHcEmmufdSOZQtbCOzFraCpoq0sfuXeEmnCiM4lXoWW/Yg9Ku5MBvIWp?=
 =?us-ascii?Q?JPMZcmC2kmTKy8BCONu7AW/l8gA3/wSPkofEjRUHS/nj3CJA19ZGmfUG3pdU?=
 =?us-ascii?Q?3WbQNr5RkX/NFwc4RLyMEPW20DRws+0/lLI950PpwCEe7Bhv2lshWYInCQ54?=
 =?us-ascii?Q?jzn01kbgJnECb/WRocKUcIZLzSsTOom1119PNozMSMA1xi3ht3uoIp4rE0GC?=
 =?us-ascii?Q?EtzWHCLjukHumTupt3bHE9pOz+vuidYqkaRi+Xbb5fi5VqikzegHR2VvP13h?=
 =?us-ascii?Q?t4miqpnTTPV9R9tczDn8y/LtDHigFMNK50qGoBt63OiVpZenZ7WflwIQID60?=
 =?us-ascii?Q?IPI4CuujS+U4tG4cJ04Fli7D6s8RwQ1OLsjWFAIIMOKCaNyxZT/ypvAC7oDM?=
 =?us-ascii?Q?UlwRWpxQiQSorxuwgBd+DC014isNA6R7fU5zXzuPTh/PDdbAB0YY77ZYVY/f?=
 =?us-ascii?Q?pZWpfL8/+Ao7NfJIPdQoa+NW5BQec4x0ZRWRd2VDDgVpJsfRzFi3IAUThmfV?=
 =?us-ascii?Q?BdJNzrly8EH34rheqtlKG9YS5Y8LT/oDt/k+XnR2w237D5X41/LqJwC/DRuN?=
 =?us-ascii?Q?RoFwueCZFrSMGlRA9BMLiuWbOAA6bDXFkrMDYvHTP0LfL/DbrfJmHhvm6Sxb?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hqYnYBYdFM0QmCKcukjFFYR/ZZR34ZtV3BExxOzhNyuNGyPnuf+nz265surx995WcLCJfF2iutBWLlxH/Yr7IPXIFzt6l8wrb+yEHZ0noEAHCppFMa+edQMhJY+a0H1DzZ4dmvRFMwA7LJW4hq9aYRy/2cHSU4HSwAKuRoYqb97cr7cld9X+5R0oBY7pM9WL1dh29woGo1lwkcM+XJU/hKTYJ0dG8lctbxJLOm7VdK254HQv2918iM5rYl1sRnTIuozf1oxpt/K04P4TsHVK/Nsrsszfl3HQy3MOrndlqaFr8OGqhKJy2gs3xvqf3huWQ9k9XAb8kVR/OuRtJ7ky0QSjvyfVNzdS4/8X/e32VUXULQWohh3POADsizDF1uNGcE3KaPKTw+AU4kLMKh85n+2cdLbyTgok3hBtuajGuCxWrPX2AEbFZNZAVAPiGrCMjR//IZs2nVxkSFKRPNhE/oO3VVU/FD4ft9p20Nj7iwCDcHkcWfoNaia31gE91kT18QsdLX/QhaNRptEii5UcYlefYe1OQDw7I5lkVaytmb/besaAkO64khbYVwJgTAsFP8B8meEeiI3qYV5RdMW4AKvjDL0bu3uGv1uZWnLguBA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d9b676-29fe-4a91-91c0-08dd0039ff39
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 21:12:05.3954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvEX5W3kU/Dn4ZVR9BGjROETSK8bdIcjV6/6KvOK4hGtZcB3UvzJuZWa8uESVFafHkc2rlOvn+w0kcO16bcxnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_18,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411080174
X-Proofpoint-GUID: dZpqodprzhmdcg1-jA-LNzRQzyoJ_XmJ
X-Proofpoint-ORIG-GUID: dZpqodprzhmdcg1-jA-LNzRQzyoJ_XmJ

My intent when writing the earlier tests was to have
test/unittest/usdt/pidprobes.sh as a sort of shell script library
called by tst.pidprobes.sh, tst.pidargs.sh and tst.pidargmap.sh.
Alas, *.sh is executed as a test by runtest.sh, so
pidprobes.sh was treated as a test, not a library.  So rename it
back to what it was called before and make sure it works when
invoked directly by runtest.sh, but also let it be called by
the other two tests to test other corners of this.

(Also: apply some small review comments that never made it
before the previous patch hit dev.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/usdt/tst.pidargmap.sh             |  2 +-
 test/unittest/usdt/tst.pidargs.sh               |  2 +-
 .../usdt/{pidprobes.sh => tst.pidprobes.sh}     | 17 +++++++++++------
 3 files changed, 13 insertions(+), 8 deletions(-)
 rename test/unittest/usdt/{pidprobes.sh => tst.pidprobes.sh} (95%)

diff --git a/test/unittest/usdt/tst.pidargmap.sh b/test/unittest/usdt/tst.pidargmap.sh
index 0c83f8703539..3594e782b0c1 100755
--- a/test/unittest/usdt/tst.pidargmap.sh
+++ b/test/unittest/usdt/tst.pidargmap.sh
@@ -8,4 +8,4 @@
 # This test verifies that USDT and pid probes that share underlying probes
 # do not apply arg mappings (incorrectly) to the pid probes.
 
-exec $(dirname $_test)/pidprobes.sh $1 t t
+exec $(dirname $_test)/tst.pidprobes.sh $1 t t
diff --git a/test/unittest/usdt/tst.pidargs.sh b/test/unittest/usdt/tst.pidargs.sh
index 53cba7c39624..0156d23f2f28 100755
--- a/test/unittest/usdt/tst.pidargs.sh
+++ b/test/unittest/usdt/tst.pidargs.sh
@@ -8,4 +8,4 @@
 # This test verifies that USDT and pid probes that share underlying probes
 # get the arguments correct for the USDT probes.
 
-exec $(dirname $_test)/pidprobes.sh $1 t ""
+exec $(dirname $_test)/tst.pidprobes.sh $1 t ""
diff --git a/test/unittest/usdt/pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
similarity index 95%
rename from test/unittest/usdt/pidprobes.sh
rename to test/unittest/usdt/tst.pidprobes.sh
index aedc6256f195..6fe6d752a6d1 100755
--- a/test/unittest/usdt/pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -6,11 +6,16 @@
 # http://oss.oracle.com/licenses/upl.
 #
 # This test verifies various properties of USDT and pid probes sharing
-# underlying probes.
+# underlying probes.  With only one argument (as called by runtest.sh),
+# it verifies that USDT and pid probes can share underlying probes.
+#
+# Other tests call back to this one to test arg-mapping behaviour,
+# verify that usdt probes actually fire when overlapped by pid probes,
+# etc.
 
 dtrace=$1
-usdt=$2
-mapping=$3
+usdt=${2:-}
+mapping=${3:-}
 
 # Set up test directory.
 
@@ -86,7 +91,7 @@ fi
 # Check that the program output is 0 when the USDT probe is not enabled.
 # That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
 
-./main standalone > main.out
+./main > main.out
 echo "my result: 0" > main.out.expected
 if ! diff -q main.out main.out.expected > /dev/null; then
 	echo '"my result"' looks wrong when not using DTrace
@@ -131,7 +136,7 @@ fi
 echo "my result: 10" > main.out2.expected
 
 if ! diff -q main.out2 main.out2.expected > /dev/null; then
-	echo '"my result"' looks wrong
+	echo '"my result"' looks wrong when using DTrace
 	echo === got ===
 	cat main.out2
 	echo === expected ===
@@ -297,7 +302,7 @@ if [[ -n $usdt ]]; then
 	fi
 fi
 
-# Sort and check (dropping any wake-up firings from deferred probing).
+# Sort and check.
 
 sort dtrace.out          > dtrace.out.sorted
 sort dtrace.out.expected > dtrace.out.expected.sorted

base-commit: 1a87c88ebb6e8b13dc5ce348d825a8dc3512ace0
-- 
2.46.0.278.g36e3a12567

