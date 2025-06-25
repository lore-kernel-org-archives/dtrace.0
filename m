Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADED307490
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825282; cv=fail; b=Nin387igbUga0IKDT7lp/X8Hshb8tHOxDoYlnXKBAdydZfvhMRHF4E8YoCBjdWo+cT6oVWT5xQ0d0FrELVTEd2qH0Ngru48mH3UEyQW18wDQqfaxARKig7myYcwXg75DDrmR9hkIJU8iB3VATr0cheTyVgJ7I+ZHw+et0oHxrcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825282; c=relaxed/simple;
	bh=PNKOCm7IEuJbvTKIH7UVboTdIpLiVu6WPRT1duEaISM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I42PX6Im7js1SLsIdE3r7zE3Tcbl146TXm4c4ktXzEgE2So48q9y1rPS8NUArrZaH1YCwhIOinz5lKck/Eesh4eO9nkudO4DiexF9auA3L58dEeIOOlvhA8/PQG7S+gvJsruP/RaPHexWcEAdmxxF40pmCL069K3hGJ3E7Htly4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gcZyqiMn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e433kbMl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gcZyqiMn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e433kbMl"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMigD5002703
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4uNpYSprA2wwC+Vd2g
	dtETgqu3JQmrzN+JUVOAA2CyM=; b=gcZyqiMnhAf790JgduILVK3sLg2HKDjrZa
	3Aew4sBdlEKTDyd3aGiFRsPaPFYJbffpwcSh/csThttCPgT87zgTt0+12LSsbYMX
	hMSeS7KB/eS2kqV2I9Zzvqn7bQrZ+ijcGaYCUJL9A1IcRduLWRuAcanLYJ6hBs1n
	gARFybwgu5xKsUZ8+dBtcB4ULEZxlk4qfcfS+UPbc5wbqUWdUDlLNqp4tiAHH8Sq
	EZFXD5ftcnJCqxu+dP1PJc08bP4tBU2ckukfdZPex1aShXafsdwvFAm2sZ+vc4mP
	nfWUhm6dMS6KQovXZV1uChHqNa+kkunrxS8vkAOUJwb/YhzGn0Uw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds87xhkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1bPnv007432
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hkus-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyfdFXWeEWYDQNVsm6stRIYEvHnVVh/XzVrY+UEHXqa579t6b0syCkXXJFFmEYvGK/0lg+aRYR12zLniRMPFSVqqDeVV5HJWYbeQnu1Plc8GF77xTtXVYjN4XoHHcFBd2tywpcxysOVX6md0zkD7/jhJEOi5qJQudnYNOw2QBmH207SGxX6GubEStqeKzsCZUKwx9K1wSpVwu3sJkSHHn56zi7Nz62icTz2fvWE/jbCgAzPqRSoAUz04Qd5lAXn4Myjeljk5LtQnb9rbPsXdQEgsTBLbx6P/umJcACmH1xnLgxWPvpZcC/KdaK0ZD3N+XlQ8RHfLRPDEwzDBC6J+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uNpYSprA2wwC+Vd2gdtETgqu3JQmrzN+JUVOAA2CyM=;
 b=q8HYZFpXCDWHrdnUrVvgaRbTPyDQU0VxvR6qQ9Qrcpz9MuwCKmNXPQN0mmXGs6j8REQ8hO7+tbb8fsp9BBt6jfb0k2Wd7cPtWKNlIaQ6m6u7Eqhw9nqQdKKdKVDnd0LjAK1Y94uLO4HPNF+B6IKF5zjryMycgkEFxZ+iU9dz9+k8QdD9YsHA0wLht4t+oYt56Ns26dfCoDkMPNGXE4gPJ2qsGp4qxHVQTTY+2vrFhYFDviDlebRx30FajhrepmjK4j17i4kt4dIM1KGCAx6phDsN5xEoSIhf7+MTliLN3EnqPGa9mwhzbdjLutJWuGu+Ynn4a2gUd5j/6h3KBeH4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uNpYSprA2wwC+Vd2gdtETgqu3JQmrzN+JUVOAA2CyM=;
 b=e433kbMlDh2glOmQTRGWkTEWZeU8PSYXmUkLdX+wGsqlWXc/spHQWWZ3qsCIvqmayL37Egqnuocz48iJ+4bXOVE7h/SSOVzZR1gbz6MlLXpzfU0oV1KnlSk2qSHbczMYnxXlg1R0t+ePn5XARJHPe91Uimg++HDmQn6sJwUNmA8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:21:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:11 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 02/14] Add stack-skip frame count for rawtp provider
Date: Wed, 25 Jun 2025 00:20:55 -0400
Message-Id: <20250625042107.13571-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b44a56-e92c-40ba-a217-08ddb39fb74a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CIlzmvZS1/1P5QX5qoiY3tfaDllwHSLNOX/nNIPy4YkeP4S+9rlS24jA4Fbh?=
 =?us-ascii?Q?6itJA/7MPB1u81twRk3MrRME89Z+8ZSrT6ev/y9HakUbZyoPb48xUCt/X4IA?=
 =?us-ascii?Q?BZdAcuXpgxI5BHq3EKGAkviWAhMG+LlLQkum5OrxXpJ0PiZARoSZtZfVsNOk?=
 =?us-ascii?Q?xe25EAVXqLO7UdTwoTk2A39xzxTn9O5aErhHH8hiVzcGes2/iIVzsEq4+q/q?=
 =?us-ascii?Q?78BSxNgZEEp6YX/4q+KBYJi3n0HmJdLCR6O8IdyfbclKNrErYxVfKmElEce/?=
 =?us-ascii?Q?2qoT4/Agf9GyGCSxP3RbW9A+1/dktEi+W+aqV+i6t0IcmXgD9niMA8PozHNo?=
 =?us-ascii?Q?fpa+xeH5QBWXdP5q1qs0U4lAdZOcwCUrey9KyhQHj93Gn4DHLfoL2/F1c3FV?=
 =?us-ascii?Q?mPmC1WqO2vZw2N0K18mDg6xEvF4g07jRL/2Ac1GRucMtGUchagLMvAHgIaRt?=
 =?us-ascii?Q?mAqeCuJyfFm68C3MW5L34ztqEQy8A5tZZsn4m7fOzlu0HNt+Pp4n4nPV/ka+?=
 =?us-ascii?Q?nFoeimv2QVSRpxcqLkB2epEKogaVMfCa9jjJuogLu6NaejMWl+MnOG4UdGVl?=
 =?us-ascii?Q?5bdDsHiJOLDI1irlUEMKYhxFgsW+UG0E1QdpgXWCjGP9P6kSfZT6cjGjc5R/?=
 =?us-ascii?Q?4n00pidXUo+zcUn/ePsWiEz7rcNQHKczY62Ll1NshvfzlJsGMKhxB6IVAGPz?=
 =?us-ascii?Q?uedCA5xlvCZSCVBEGa2wiaTfWXRgFwWEHH8AKiHuMbxZmtA4OpPytJ6GDcsj?=
 =?us-ascii?Q?qyY0wpmI/paWGVZB86mILynu9fPRzlKEycoY3QGMz+1D+0nWkFtUWebnt2ie?=
 =?us-ascii?Q?VIXcOZowMDJFRs8bfsDBxbvL0bprk0Oywjuzx62HOGd5DESe4FFj1uVOz/Jp?=
 =?us-ascii?Q?OKCbjfw5FHQhLGbe0G0aFTFYatmZzXs2MNa9KUwrLWfI2Q/Nh0/LgEAaSn+I?=
 =?us-ascii?Q?r8uOuoS274YN7Z0OU89QEKsnU0oKtGeNYxjZmtT9YfwC34Xyu9cSATAPnbil?=
 =?us-ascii?Q?wcXUowe+qag3lnOXqCi/GjfhBMaxwXZLgzjOzuytt1JmIGh52oscddK9jh7v?=
 =?us-ascii?Q?RV9JxS8Y4itzx89um4nXz+GV9xAuT03aZp+lYZL1geveun0moGbc75+Y/pCj?=
 =?us-ascii?Q?HsqBujN/fQgyyMqXiNtGb3rfwi8Pt+OowrebIwtwlzj7aWY5WWJS7Yt136aG?=
 =?us-ascii?Q?I3vJu/8A8KVfQJwrbb3o58/U83DLtHGD4RIRwGxQheXqig60hu/OlOoJhip3?=
 =?us-ascii?Q?8ISRM1woOEJIXlpF+2Y+/T9o7tSbZSHB53C32b4Ot8V16mM9wveu/qfjxGzL?=
 =?us-ascii?Q?UwBeMvGBCpj92WF9Nh+LvKYbhm0Cq4qMStXNXbRt70CCLLVXnsu9XPECA1qY?=
 =?us-ascii?Q?UpCCJv8BnfujZZk21vv3/wuKNAmSJzheljsd5QWY6UEt2Fv2tA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ay576WCv2BlQJP/3xqFIOmTRhoKPzBxQqcErpuZ1HwBzXHrfVl9Se9TkhZcD?=
 =?us-ascii?Q?2DEQp9qj8kUNkmtrRkYNTA/MTKZCZxI4DMBIMh2JAw2CrmEDobI5ENDR2Sga?=
 =?us-ascii?Q?PHUhixe41pgANsoSmt1C7RjyattntRnze0fXpDKlUglN+cjx6CoF8b6nrHMH?=
 =?us-ascii?Q?v/k+dNT1+nnLaJ0H+Jc8YBob4SOVUVWsi/PVIhz9k5hZLhruLXXL7s+7Fn9Q?=
 =?us-ascii?Q?bnN6exnUKbgZE6LmPJq+BWgwpzo9MVllt0lI8LJksF0Cw9KHCVmzOphSg8GS?=
 =?us-ascii?Q?UR9nFWkWeb7Cku+jaaVjOibAd2UfcDCkAYAzS6s0KIAbdrxD3ql64Y5gfc8B?=
 =?us-ascii?Q?9WSFnfdk4LYrJzCjOk2HN7vaRhZdrJw91eHUknBDShu8XSV+u+VXwBSDORsR?=
 =?us-ascii?Q?7Hntn2OuDULtcWBA2kvhGMrzCTSUYwKwPBDoZp2G4Q+7ivCcs10HXrSMYXkD?=
 =?us-ascii?Q?Vqe6IL3gp39L8v3siahA8NNZfegVPVkMOvCTRLjK8ILxZT5GngxnXi3gJkdS?=
 =?us-ascii?Q?FG9dvu8L6rHf9ZF+6+hxATGpjAEuSGcBS25gmEtVcbwjqrYa3XQkDEyJcJRD?=
 =?us-ascii?Q?n07cwpRE3oAUQh+8Ar9+haawIgns1I4AIxOq+pbkAIOzgVms4r47lI66L6jz?=
 =?us-ascii?Q?TiUedPsLZA3r+3deukE8J5HqAK4pZfVDO9DnknqSkN0UYiPcKfJf00XLnIAt?=
 =?us-ascii?Q?3+xNJSu7kzr4u7nsFBcbxLqNWZ+ecCiCW4ZlGcCn8NiFjzRzPK9ROPzOga5I?=
 =?us-ascii?Q?z+ZbBbJiuliQOtiDbBLtf0z+MucaB8pOIpGqxlEYOuLKDsYsXVHi5rgyP608?=
 =?us-ascii?Q?DWC2rYBwVonJB5dEbv/yzCXoBWUE7DxSzAw6fjRvujI5113F3ff0yLHAYly/?=
 =?us-ascii?Q?kVEBTOpWFbjf54bW0PR/yHAq7upTU+2ITjAUIP/elCEL4knMsAS3Bq05OJdv?=
 =?us-ascii?Q?OGI5crxwoEXoAH9IPTR2kQ3h/g3InzPZTTpLdjASc+ox3pf2HZ6IKbmcEi2N?=
 =?us-ascii?Q?rH8yXttPnDRzqM33OXCD8dB9RiJp7nuQ6uD85BkoULwyR8YBp2q1SmpuFpmA?=
 =?us-ascii?Q?peLusnxThw4KL4Bv0mR4pNqPosDUdPq/5J1ZoDtJRWN6gZjcbUZuZ6XRuisR?=
 =?us-ascii?Q?rDhINwuKlLAL0vYr6sKdtgO/M2CnE5uGwfEoLE/3U5cxVfm+4dVB6a3GNkOT?=
 =?us-ascii?Q?JGGtoV1D9gA+qqBeiHySof9IoOiYWrPS/z8FQTWM8tYbVEOSZGWVg8ZVP67i?=
 =?us-ascii?Q?6tlsYJlT52ETg+2F2XIEi7d6NE/v6gYycuR+eEHYteOltEIzWGIdIJff5JUS?=
 =?us-ascii?Q?JnF1pwrXWcfGf34vS+26q6jDyK4byS93H8PdN8wdobtUdJ0bkcBzyINjDRWY?=
 =?us-ascii?Q?d62k4gxGFahugEp72GJfnquJXETNw9IMURAysdXrixHwvDpwYOHo2KDW7czy?=
 =?us-ascii?Q?hQDqqU8roR++qrNrKnLMxScKldFOitg8pZR4B6dmWXQ6t8mxe1L5eEB86ueg?=
 =?us-ascii?Q?DVisQvK5tmesa0ShaI03HPvewqCLzceekUZGGQB3EDLOcwAFa3RtC3jf0TVo?=
 =?us-ascii?Q?V0Y81hqP/fqJH4YgHLIsz9bBxytzmPPb8VW0Zdo4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FXZExu77uuSUFR2EQrcLRYYiEH0KMjKD8CYWhrM4/rXPFg/AiMlHyMuHqq4o71tolBYHwH2n7Q0o73dHl66muZKcBnd8wyVY5Kb4HT4Movs9CSjn2XztuPjdRr3NjsTxnmtlHaLJn448JQoQ2joXfn7obG5duQAMI1m3OJN2FPH8rRX2p4DypgC5RjKmaxtvcz0XYKOqT5YKo3CMwc0JfZi9iq+Iw72UJNWIxBd+QZ68ge3EyWU0z38clIOPwp01giWfaO+55gtNJUyoSDWErR/7opVaqYIGvmDYdVG8lxAjdQBak40IvGS7wQYwv16WlHxiGif2abU52KQKsy7wfbT4e072pL0O/J4OU7ze+z8jxAWVTv4B7Z52cawh4YsrkA8EprCmg6HcumT5fBHcjAIvXyYDpAwqlLMi/HyFnAoHGRfqz5op0VB596hzfCrLkaBCDUKynMofGM6qDRT7RlgWylWhUkb6Xfi71k/jdCQ54hWAD6SNqApYfUf8pm4EUzAe2Vh+oUfZIXO1n0nhIE5B7PPbPATt9QBduBSCF43W5DVfIj/coZfSEqv7hPE6xKyPRaRmE2PUJUr7jRPjLSwZC6ZqolsM4S55F+Y/ymE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b44a56-e92c-40ba-a217-08ddb39fb74a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:11.3857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlvJT6ILm75gTvFlyf+++B2TjNRZfI6Zska51JXhNwXFdVDMQKt9yCE3BgHtv2/jasc3yJyxiT0Y1/+98lu8KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=685b793f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=26Sn6DwbkJ2VNwVrCaUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfX4BDjUqh7mWi5 HPF+Y1rQoblMGmvI6H2bDy7i79cbQUsqWL2WWmwBoSgaBHAaANpA4IfGz7RHc5Ee/3TCMvu+Zaj fJhUnbNsbTEYE9SN3EQYlC2DtfafbhKlxcTGL1V1rD2wrzCyhLgoLsIOy+xsLYjiMk3xqQ5i/9D
 q7RAZMTCalln7mHFhOS1dI986+31pMjLA7pz8jT6zGlFgYhwDEv+91Pf3+IvqSOqS0z6KHmLkB3 BCIqN/Gm3SH5IVW71AEPV+NBdzgCqQ1ecxwK1B5RnDBuZ1JRzuiWR1aTYi0AVE7qDxWDLkDKs2R dGMpyw4XLcovqvGH2fCiWBoAFGIfg5jJXsJ/R9srPof3lQUUlqEp8VgLw4NlSF/yy7AYLag5DTF
 WgPnLBqmIiDmSqRcBMdKALyy1LZdKvRKIUKWIkeaQy0L4rer/XeNGxZi6UgQqi64k5xWbTwb
X-Proofpoint-GUID: 8wwV0ScJG_zh9zzpCqB5gtnBw9HfDYNb
X-Proofpoint-ORIG-GUID: 8wwV0ScJG_zh9zzpCqB5gtnBw9HfDYNb

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_prov_rawtp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index f1d3b6bc4..a36bb51f4 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -296,6 +296,7 @@ use_alt:
 dt_provimpl_t	dt_rawtp = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_RAW_TRACEPOINT,
+	.stack_skip	= 4,
 	.populate	= &populate,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
-- 
2.43.5

