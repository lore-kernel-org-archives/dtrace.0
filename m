Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C781A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466760; cv=fail; b=hlqX5QKKPVbKlV3HycdcpRMNYUiyHDKvrzmmFEzXFMGJjINHlTiFErJaaIezy9uwcZKQYYL3oXEekcQXeWIVwG4PhATAN8ByIE5zEOkMIrRQT3v9HnNoznR9/aWyd+ul+DWik7dG+upfy9BIbyyDD1tu0D+j5DryKmkGFyNJMAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466760; c=relaxed/simple;
	bh=vsMMuS+Mg8eEEkCXVF7tPefii/f5w6MT6nDpb0KqiQ0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fR/ygoXLt+j80P03FcaTWa7cGhDKn1prUr9APtl2hQFmZZ/FSu6b1wx4ZnrURIUE4nYonOZK9rqmyHsizJMlFb9KixwwAh8cFpcmUmkze/1HVjrL3/nhykPKPWdKa/Q2VOap5D6lFfJ46bN7S0q8tbevkxExpejrBKpDrZghep8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ixPxXf/5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Sw7JdfuZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ixPxXf/5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Sw7JdfuZ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMTlP007265
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=KFhUvus9+Yf++Y
	sUQaqRMyun4bC5MHH3QRzIZt2JbDc=; b=ixPxXf/5menFUGV0QZ7EfHKHqNSJy9
	NP+mu8cgeF1mlWw4uq1k7rIfUhGGfwAVCDLdvewv/HwmWeqbrTMgHbVlOiD8mRyE
	6ZykvIuHgnPZL+YK1YNnfdhgDILAUZj0ozI67zclPlbEipZZ1g1VYc6Dhyopwysc
	gs9x03mc9Q/3hgC9hEKiCCUxFx1VA6G8YWWzd7O7obc/S1pquv5nfWcryRsSbx14
	ZWZ0Xpl8iil4I27pUCFfl5of0pEY5sWOPB64QuuLOOJ7VDtWH5o+T7vkzbsrNa4t
	pakzd8rGvCY6PA9uUEegVE9r/DWM/kfZT2rSybLyZefSLWkONh98Rqww==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywp7smxay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3ISkD037192
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:17 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2afh9q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0nyQYkgK+UhYU22k/S914eYWay4ljilHloxlUSZyTITrRhW1aww0TZFz76IDkRZbeLhV2eMJoqU0gmLy14LSMSpMhon6Zzk+EWDnriHzXXAmQgksVReOV14LMv/gyewzz8QvkwhM4fEqGtrStW4r5SyLCv+tij4b49ayAA83fKWlDEvi0OQuCKJTZ++6xvwBLqaci50u/fGVBx408P1cN3FH4dyjI1IZWS+tdBKOBLy99NdCLAoWmlPDOdCFxwiyOpBAWmOHU1Bg1SSBBU2dUvSwXW52dqU/eeVw0AVJ2IzipLFVNsiTKv4/JP0bZsx3gFU/EAjQ5yysbeIZsFbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFhUvus9+Yf++YsUQaqRMyun4bC5MHH3QRzIZt2JbDc=;
 b=BaloRiTl5wqunPxG21rK6JWHPyYY5FIARdT2MrFXGXPKtSCcaSfrWUExPN/z0GuxUYB71xpQqaWuQb7fAZNhYUc5Mo/dbaQRoM9Bnw9sHYSMpWurTPQ+b72GjHKXgiQEQjBTOscMQrd8xNkmosAwoKvJE46/Ve/9gP9/7i8sGKv/DWIVpoa8jVKK3CAA5db7d9iwSrRhBOzEsi38iWHRnGGFqNOne8fwLgwYVAsGMcL5nz9PjJygOwkben4a+w3da9C4ClVYTV5jSUtpXbe+uvEUthJVTIWfENDCGjsEukuEfntEttmGzT6ve50X2Zf/yU3e8fwMhbMTc6HnWPPW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFhUvus9+Yf++YsUQaqRMyun4bC5MHH3QRzIZt2JbDc=;
 b=Sw7JdfuZZrlyn0Sibco4asXzYfse6qg8PB1v7WgJGNQgqJhEkm4CfrEqabUGuRiSPCcFPM14RzEQMvUpinM1xP2od7qFVnvZ4wgXBicINjFjcHGLB6lI6mRKxMui6lL6wLZgfOMq8OvU0RvuXdNfSmbsx+0UQcj2ipzBawgEWwk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:39:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 23/38] test: Clean up the specsize tests
Date: Thu, 27 Jun 2024 01:38:49 -0400
Message-Id: <20240627053904.21996-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: cc69e555-c436-495a-6147-08dc966b7a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OZlUd9K3NlNm5d62A3zQv1WbADB4GF1Q5QfesNKInYT71YYgnLj5BHMR9Vjb?=
 =?us-ascii?Q?dAfZD2XbBvb+01HtZRmPhHh3MvGyaae9oShuR/Uv2yi1EVCiRLl4X+hBXXVS?=
 =?us-ascii?Q?lbDWQ2YN/9HNKHO9BZEmdMo4azpslbWKELvxRXYVftsqE18UYKJ8sD/zSH52?=
 =?us-ascii?Q?5zX0K0P5fdx6/BR7D8XPSQN35JJR/eA7QpWS918EX4v8p0oCgS+x74DM9tLu?=
 =?us-ascii?Q?zz/zNCTaKLKSnsIqTZmHawdptGpd/tI1iNv0MEFEUt383k3YR9tbYXy8fFHj?=
 =?us-ascii?Q?tCrExBwjarnbyqKvpof6lhJwXE76itPKINBSlDi9mwlEQ2WDA/U7TXgtaRSK?=
 =?us-ascii?Q?AdU/gWeRwXA1YXMhjlS/LsdfkyF71z9QPLCi0+JeAySLoyX1of3RbSSP1wB8?=
 =?us-ascii?Q?c68B7n5A+3mutE/jiEbsar3FKqCu3s8tRr5wirvtRc8Z+Phk2JoXS8zKQxkW?=
 =?us-ascii?Q?DZ6Kd16qtftCD2RZRRdMjTEHpS+O7oOz+XcWXP36/bfalUgZ7WFQeCDZL4iR?=
 =?us-ascii?Q?ePZssBBdEO8izJevidm3M0l6RO8QuwBm85eQnpUNCRohfDuMZGI4Kl6oy9xn?=
 =?us-ascii?Q?SzQ6hdsl/oys4AFhIGs3Qgqh5UT3a5a9yYGFXN8Mz0j2LJW+Hgn382Q5ixwn?=
 =?us-ascii?Q?kDTRvXJfhiQB21Bjf9111j1B1IRyHB8FryPPz+fSwPPZgU75PnBHFPyXVlQR?=
 =?us-ascii?Q?A5wk5DeG7necYj+U6pPw6YbcTZf/OWC661w+a0RxbyL2e87Gkb7ggYfSGmux?=
 =?us-ascii?Q?JhY6vgNI6m+xq0Bje3jinCyRTavUjONZ44zT6htv3LsNAWhEWh6BYUTarXC3?=
 =?us-ascii?Q?VTANwCznWyZSM9D2SlWp35tR9tDn5awWrv7PpjgFNDz0t9kwgnS0/wBRMuaU?=
 =?us-ascii?Q?wXrgz8dfls7KRCnNefs4lZ9yYJl3+5zg+r553v+H9DhgV85ZxJ1kc7m4pO/k?=
 =?us-ascii?Q?lbfZO+P4sxfCmzxg/1imivFE4cmPs6QbIfajdvTynkGCLHjFrljmKmQ/Mgts?=
 =?us-ascii?Q?7gultAZzbM1aRLkqcprXFy+cKVD+69yjgeEnVh0/2JHMqb89YsIBzdCWcUm4?=
 =?us-ascii?Q?Eeih+ygBn8J+sQ3EtJhBJaV0/dk23773qD7CRMiwjzWdZhg12ySvye/xE+5f?=
 =?us-ascii?Q?h0qxqeUYzw4JWJ949PDiDz3dNClYeoJxr9NA0L1+qFgqwzqR4IjtJLhL8pIb?=
 =?us-ascii?Q?FZV5cdbqqg7ODyWvoZtGQpnjOTis+/Fhm4b+qRM9piRxd2LuSle/4fPGJ+XV?=
 =?us-ascii?Q?YB29qx1il2u0dP0q0TncTLxtVpaZdHAQ62u0eBu9JNFvXh4gnhGbMirv2zKh?=
 =?us-ascii?Q?g8uJEtg0a3KF4kHVkczM7+h7EswA1ekp1jx+BfFSzDEOhw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YCQu92k7n6Vsnvq9ZcTZe6eEiBIoP1/dafqzFoUEFmD0O6lhPkqGz51umy0i?=
 =?us-ascii?Q?D94u7K387nVT6vtFM6v16xIXKjHwG7T0NdAbO4R9atQdgq+5ego/KIqNRq0k?=
 =?us-ascii?Q?pva1/AmtMQdS1H6d7QuDzvvBKaCeOgCk7WMl1mt85FykEdPAwnAE6lutHFtb?=
 =?us-ascii?Q?aR9ipvKLUza0t1UiOG+7NbSe/VLBOoAGaRzhLmro7dWvFCFR4AeeR0aHk4ev?=
 =?us-ascii?Q?eBKXx2cwzqXrlD915TSz+o8hI9a6ghZxm+XVoEpYr8kTcLHMVyqDv0HFvkne?=
 =?us-ascii?Q?QkmeFAdE32dpO9i2S0Aar9s8UUs+9nAadhfv8923MNxM6gRHEH8SGaFGxVOx?=
 =?us-ascii?Q?qTFwIahaYIgxoMtQ7pBPhGUTugLvJ4pI9iYvvb+z/GJ8gXeGcbAlN/6CHEno?=
 =?us-ascii?Q?PVwtd0tac+eadAKBWkre4gw2t/KNubU4s32WQRo2EMErCQgb52FDv62wftAE?=
 =?us-ascii?Q?+klbMROZ1DzdfSXbpW9sxOmMiCl3YLehwecrferbyY+HAqlctjt4Ooxyhn4V?=
 =?us-ascii?Q?FPBeKywQ3QNm6Wt7a8HFWioyYVNw+SKfxM0cVMEuDmJAL9PEov4Q3oimqx2M?=
 =?us-ascii?Q?NaDTgfOVZZFk3D0WRnj06yNeEEHXqbf5I2tqSMrySEiCGsDggfZJ5vGiutZZ?=
 =?us-ascii?Q?xJ6KBvt0CkuNxELfWiL4yeFi40MveaLB/TvyAkzIVmeVxicRDCf3pC9xhJ35?=
 =?us-ascii?Q?fSECj7ZeI3ZRyu/lXhTY5+oUHKXDq4hqZ0ZftoA3XrWf5HvexqtSeHxXW3O8?=
 =?us-ascii?Q?IkRVxsPzvYpgmPjWUEeSKr876uV5XpIPnL27UK2HTNpanw9VyEWWflL0fur2?=
 =?us-ascii?Q?GWDfxOOAp76IQsHA8kSvm3lxUJxRnn8tr46+0Jfp9/jdIXmaocaKTICy6Ex4?=
 =?us-ascii?Q?rI7Ia7yJkO+uvJaWiEbIwLeCqoVx0CZBu0eVXA8sSnDzxQNmD/fCwhTrJWID?=
 =?us-ascii?Q?DzuYR2+wike5ipEgP4aL9XiAi+dQcaellEPGMEwYEeMHMBKP2zU7fT+622iq?=
 =?us-ascii?Q?B4X+U/cFQXhkwxlo2LleBF+tHjMWk2FKc0NYMRSpausLCcx0O3JbgcGz67NS?=
 =?us-ascii?Q?HKVzAWhfZnGDtcVyWnzx4NVrodKgLWFye5YKZK2MilSwp4mMZcCiylSFkwlG?=
 =?us-ascii?Q?wPxdsiY8rr/UB5slaGpiy5ESJbb3jBMeu+bozR6DsXXiVYnAC5KJVa0/assV?=
 =?us-ascii?Q?zgJpKHu9NUWCiu3ewMk7b4GKJXWcbaAB8YfWcIQWdciHDpTYpW2gT0738B+B?=
 =?us-ascii?Q?AlnEra5GKt1kWtlv7Zq9F5gZkbZ5Z9Bb6Me4DmqBmwuUnk6+KnCgzjWNlk1/?=
 =?us-ascii?Q?nufqDUxsp+/5tAWuQHomK1QYIMP1FIJyWv3qeYNBbs2pg1kjWRbjvLDBbgED?=
 =?us-ascii?Q?4bBP0HLuVY1Q99tqYxlIwU9RruRBPuh5onsnpXlV2Y+YJ8P2uMW0bVPjHB10?=
 =?us-ascii?Q?oChUVBjxhpY7diTlpRHXP44BVQ5MlsWWSbTfnkrSVjS9oKw1QBvx8WXpS8le?=
 =?us-ascii?Q?/wMmkBRo3Ht2z1g3P7j1KOtT86Dr1dk+njDE1v5poEAh9yiUYxRkjtSenoAZ?=
 =?us-ascii?Q?1zdUAT8QQNDT1biKaBamgKboiHv/5tB/+hntC+Xt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	26aQNHK6NaLtKqfmLjtqqHxv3z6R0WPbvlcl8sDssbckjt1kvTmb0XwEJHYzmEds0j/v/z38CnisggrlqOjJ81C0FgAgfqyC650hsSsNodQNAYJemww8H/oXAwPv324eHNnYrtPV+xJ4ljhmjSRs7myIpHDDZt49AqY5oMpu0cc7krLQTwLbLmv35eZz+/VF9NKXi+lqPuKCfvYk3AMQ6fFzP1UI3qU47gVIZ76jDVAiTKNVch18wqhWQVTOO6cm7Rdrm193C5g9/zowKICfciJ8SZjmXHPUub2uiH4KiecxqX8R2WAo8KODxkh16nuQ+x58k87JP41cyvfzob/shv/LWsqViuH9q1JpYrc0sOdxFUUxSxbFyzKOrTfsMbw/GrUjRj0ads5XWE/EXGMAk7CzwIU8PWOE9RCC+/+GaiYhE6x0iMou6k1Sfgy9vtJbHE+PriqLQpXggfFPR/EaQBpWbJwaGCAKmiSSLces0VLrGtbNenfOWLPXf0UUE9+FpU6MsRq7QELlK04l2ZT1+rK1LX+qNpycxVoMOf7u5PmH7g+4Y76FnlisZvk1m3c3CBA9xCREH5nwtqv1J99KuzlDyHviuza2C1QC4aEJfXM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc69e555-c436-495a-6147-08dc966b7a9f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:14.3783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LR1QQ6bMM6JrhKshw/mK/V4WEKiv1JAPVsPAudgAAjqiWJT7hH7JIfmmh0dN/YkRlV/6P+RAlHXQyEwJsq8VWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: y6X_PAPDVOKk44KnrtpjKPvIQxlwh4be
X-Proofpoint-ORIG-GUID: y6X_PAPDVOKk44KnrtpjKPvIQxlwh4be

From: Eugene Loh <eugene.loh@oracle.com>

The tests had actions like
    printf("%lld: Lots of data\n", x);
    printf("%lld: Has to be crammed into this buffer\n", x);
    printf("%lld: Until it overflows\n", x);
    printf("%lld: And causes flops\n", x);
suggesting that these strings were crowding the buffer, but these
strings are not passed from producer to consumer at all.

The tests also only tested one clause per speculation.  It would be
nice also to test multiple clauses per speculation.

There is much replicated code from one of the tests to the other, a
shortcoming that is amplified if we want to test more specsize values,
which is the case when we test multiple clauses per speculation.

Therefore, replace the multiple tests with a single test that checks
multiple clauses per speculation and more values of specsize.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../speculation/tst.SpecSizeVariations.r      | 68 +++++++++++++++++
 .../speculation/tst.SpecSizeVariations.sh     | 74 +++++++++++++++++++
 .../speculation/tst.SpecSizeVariations4.d     | 66 -----------------
 .../speculation/tst.SpecSizeVariations4.r     |  5 --
 .../speculation/tst.SpecSizeVariations5.d     | 61 ---------------
 .../speculation/tst.SpecSizeVariations5.r     |  7 --
 6 files changed, 142 insertions(+), 139 deletions(-)
 create mode 100644 test/unittest/speculation/tst.SpecSizeVariations.r
 create mode 100755 test/unittest/speculation/tst.SpecSizeVariations.sh
 delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations4.d
 delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations4.r
 delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations5.d
 delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations5.r

diff --git a/test/unittest/speculation/tst.SpecSizeVariations.r b/test/unittest/speculation/tst.SpecSizeVariations.r
new file mode 100644
index 00000000..51f0596c
--- /dev/null
+++ b/test/unittest/speculation/tst.SpecSizeVariations.r
@@ -0,0 +1,68 @@
+Speculative buffer ID: 1
+counts: 0 1
+
+Speculative buffer ID: 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+counts: 1 1
+
+Speculative buffer ID: 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+counts: 1 1
+
+Speculative buffer ID: 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+counts: 2 1
+
+Speculative buffer ID: 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+counts: 2 1
+
+Speculative buffer ID: 1
+123456700
+123456701
+123456702
+123456703
+123456704
+123456705
+123456706
+123456800
+123456801
+123456802
+123456803
+123456804
+123456805
+123456806
+123456807
+123456808
+counts: 2 1
+
+-- @@stderr --
+dtrace: 2 speculative drops
+dtrace: 1 speculative drop
+dtrace: 1 speculative drop
+dtrace: 1 speculative drop
+dtrace: 1 speculative drop
diff --git a/test/unittest/speculation/tst.SpecSizeVariations.sh b/test/unittest/speculation/tst.SpecSizeVariations.sh
new file mode 100755
index 00000000..75e527d9
--- /dev/null
+++ b/test/unittest/speculation/tst.SpecSizeVariations.sh
@@ -0,0 +1,74 @@
+#!/bin/bash
+
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+for x in 63 64 79 80 143 144; do
+	$dtrace $dt_flags -xspecsize=$x -qn '
+	BEGIN
+	{
+		x = 123456700ll;
+		self->nspeculate = 0;
+		self->ncommit = 0;
+		self->spec = speculation();
+		printf("Speculative buffer ID: %d\n", self->spec);
+	}
+
+	/* 16 + 7 * 8 = 72 bytes */
+	BEGIN
+	{
+		speculate(self->spec);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		self->nspeculate++;
+	}
+
+	BEGIN
+	{
+		x = 123456800ll;
+	}
+
+	/* 16 + 9 * 8 = 88 bytes */
+	BEGIN
+	{
+		speculate(self->spec);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		printf("%lld\n", x++);
+		self->nspeculate++;
+	}
+
+	BEGIN
+	{
+		commit(self->spec);
+		self->ncommit++;
+	}
+
+	BEGIN
+	{
+		printf("counts: %d %d\n", self->nspeculate, self->ncommit);
+		exit(0);
+	}
+
+	ERROR
+	{
+		exit(1);
+	}'
+done
diff --git a/test/unittest/speculation/tst.SpecSizeVariations4.d b/test/unittest/speculation/tst.SpecSizeVariations4.d
deleted file mode 100644
index 4221c89e..00000000
--- a/test/unittest/speculation/tst.SpecSizeVariations4.d
+++ /dev/null
@@ -1,66 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION:
- * Verify the behavior of speculations with changes in specsize.
- *
- * SECTION: Speculative Tracing/Options and Tuning;
- *	Options and Tunables/specsize
- *
- */
-
-#pragma D option quiet
-#pragma D option specsize=39
-
-long long x;
-
-BEGIN
-{
-	x = 123456789;
-	self->speculateFlag = 0;
-	self->commitFlag = 0;
-	self->spec = speculation();
-	printf("Speculative buffer ID: %d\n", self->spec);
-}
-
-BEGIN
-{
-	speculate(self->spec);
-	printf("%lld: Lots of data\n", x);
-	printf("%lld: Has to be crammed into this buffer\n", x);
-	printf("%lld: Until it overflows\n", x);
-	printf("%lld: And causes flops\n", x);
-	self->speculateFlag++;
-
-}
-
-BEGIN
-/1 <= self->speculateFlag/
-{
-	commit(self->spec);
-	self->commitFlag++;
-}
-
-BEGIN
-/1 <= self->commitFlag/
-{
-	printf("Statement was executed\n");
-	exit(1);
-}
-
-BEGIN
-/1 > self->commitFlag/
-{
-	printf("Statement wasn't executed\n");
-	exit(0);
-}
-
-ERROR
-{
-	exit(1);
-}
diff --git a/test/unittest/speculation/tst.SpecSizeVariations4.r b/test/unittest/speculation/tst.SpecSizeVariations4.r
deleted file mode 100644
index 7c4bb3b7..00000000
--- a/test/unittest/speculation/tst.SpecSizeVariations4.r
+++ /dev/null
@@ -1,5 +0,0 @@
-Speculative buffer ID: 1
-Statement wasn't executed
-
--- @@stderr --
-dtrace: 1 speculative drop
diff --git a/test/unittest/speculation/tst.SpecSizeVariations5.d b/test/unittest/speculation/tst.SpecSizeVariations5.d
deleted file mode 100644
index fb71dfed..00000000
--- a/test/unittest/speculation/tst.SpecSizeVariations5.d
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION:
- * Verify the behavior of speculations with changes in specsize.
- *
- * SECTION: Speculative Tracing/Options and Tuning;
- *	Options and Tunables/specsize
- *
- */
-
-#pragma D option quiet
-#pragma D option specsize=40
-
-long long x;
-
-BEGIN
-{
-	x = 123456789;
-	self->speculateFlag = 0;
-	self->commitFlag = 0;
-	self->spec = speculation();
-	printf("Speculative buffer ID: %d\n", self->spec);
-}
-
-BEGIN
-{
-	speculate(self->spec);
-	printf("%lld: Lots of data\n", x);
-	printf("%lld: Has to be crammed into this buffer\n", x);
-	printf("%lld: Until it overflows\n", x);
-	printf("%lld: And causes flops\n", x);
-	self->speculateFlag++;
-
-}
-
-BEGIN
-/1 <= self->speculateFlag/
-{
-	commit(self->spec);
-	self->commitFlag++;
-}
-
-BEGIN
-/1 <= self->commitFlag/
-{
-	printf("Statement was executed\n");
-	exit(0);
-}
-
-BEGIN
-/1 > self->commitFlag/
-{
-	printf("Statement wasn't executed\n");
-	exit(1);
-}
diff --git a/test/unittest/speculation/tst.SpecSizeVariations5.r b/test/unittest/speculation/tst.SpecSizeVariations5.r
deleted file mode 100644
index d09013a2..00000000
--- a/test/unittest/speculation/tst.SpecSizeVariations5.r
+++ /dev/null
@@ -1,7 +0,0 @@
-Speculative buffer ID: 1
-123456789: Lots of data
-123456789: Has to be crammed into this buffer
-123456789: Until it overflows
-123456789: And causes flops
-Statement was executed
-
-- 
2.18.4

