Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139B71B4244
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754505359; cv=fail; b=Q9/lRTInPm0dpyhCDHO/vaO8HSHfgt0GsninyBiDNkexjKgKQdfmGMNNp+IdrxGVGeKxhY7Km++5Jka60P2/A7W0oCbc7DJaU32kDAHt1E+X0vbRQRK/X3A56KRTgDkWDwRFhR5sFJdqdJFFHf3Ve7ldYWtK401hveFchOmCnEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754505359; c=relaxed/simple;
	bh=z5i/fmqi87wCN46F+tKIp3v7lBMIZAoXPmj804NENeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HuAxsPjoklnch1u7DzSbpH0doelwgxlH+2OEJyOF5A3QiAnERO2hni4lcP4u7lUttgrhfxFpWsa8fndVq6ecGZVkCWcAq3ciF1ljD4FACJOSZmiU9C7WU5GPZhdi4fWG9Zs53KWn/wgh6HMymRQPuLFloG196fwqL45vG4LlKt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VYj6Zl5T; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nbgi/x1F; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VYj6Zl5T";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nbgi/x1F"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GRRtW022522
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 18:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZyhsEZ8ebrNi326dO3
	pEcK5LXJuFquawmKaVr9ULgNc=; b=VYj6Zl5TVdjxB/L2V0AMsZ1sT7j6bjSA8i
	3xZh8gQmhMACeYe5hesT/+9FTwKMj9EBup4RArA0oDe++UinMk/h3A16dIAwHkes
	+XCCyaTmpZ0M8NgD/jl1MCQUnbf9p/BaTnPCzV8naLbv6+Em7bgZjcXHuqDlfF74
	qPb3W1UeaRP4C3+dOJJXdBLBt63UcaDKDkEOzvsHR9II2gZv11aGlxXTsviaCJet
	iuB+DMu9OqX0DzRs1lUdnSlRFkCToa4YjpFAK4lkvrIYVxKdulJHOJdUZc/YN9ks
	aJ2a3jiXU3OxJtEAt4gDXq5/RV28yMIzuQ6RRPow6nU/PiK8k6zg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvgtasy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 18:35:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576IZKDh032112
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 18:35:54 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwqwrex-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 18:35:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLVfp4PlB74mVRfXLQU4uejktQCD5UUj8mdJ0YHxju4Ai6zzzhP0P/c4h7OMAbmvykL/fLKPhAf5LFB5m64Ln9VU0hA76mQtUMnaTn00s6MlO6Jo0rsxXijQM841oP2LWgTYt4oNm3VrEz75uZaJ6MzTIeHxZalnQun2+KDnyvQq7V+jbRZ8OWi1z9XlUhtl1W0GrV/E2w2046b3aWDlbngWShxRJcDDNJTVaUZwdJW33Akik5T+BA3LrkbgBvTDcduQnlnRmczV81V512duYJ0Tzvi/S+i5cicRk6RW8MsjVRTfN2841SNUww1ebUnWhVy7tfvYFSTtN7x02mWrgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyhsEZ8ebrNi326dO3pEcK5LXJuFquawmKaVr9ULgNc=;
 b=vSZNl25uDOFqQsGkErZIpX4XN9OBF1Tr7EjuPXwOUvXXMnmC4LYy5Qoqvx96CeZYCmaoUfF4zgIh1GE78wXkoM730mnKFlh8+lUuoP1ypiLl/uVl+57PTvsjRq5ExeK1rWigfXG1HzAKs24kobHf+be1YVO5m7j82xiQf5vaoRKWWUiDVzwuvxMosKjbZRc0InGf1M0YKk+OvNxpHduYzBTeRCf95kn+cC1KSAeocMVdNTHB3GaGHArR508WWx+C/WgO3PVU0X2yM6YCBXMCRYutIhefEIueYKmyEJgUJafOX72JrPgHj1gD6QWie1bkMA/pZRGGXoX+U5Lh7ZujZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyhsEZ8ebrNi326dO3pEcK5LXJuFquawmKaVr9ULgNc=;
 b=Nbgi/x1FCb0l+J7jqGlVW0CmOLmb49pkDYAwtl5kMXXiOIZRoNBQY3ol4Kp6FCoiO1whUpnRGTbvxnDTGhYtbxLscvicipfAyFK04cTIsOruHmmwx1V5k710i5eGDNTLdlY/eVRjdSgPEkFA+7KliBP2jNSuEWc++DIwNCtvh8Y=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BN0PR10MB4982.namprd10.prod.outlook.com (2603:10b6:408:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 18:35:52 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 18:35:51 +0000
Date: Wed, 6 Aug 2025 14:35:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] Add function name to underlying return
 probes
Message-ID: <aJOghM26+vLJ91/a@oracle.com>
References: <20250805045111.9607-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805045111.9607-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BN0PR10MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: 21097126-9c64-40ee-66a6-08ddd5181228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tsvPWDjTX+h0waaOBdOMt7+aoG4ybmQVS0xmf/vOlTG+qz/QAXd0ANRoHaWX?=
 =?us-ascii?Q?yU85/wVPYFEh5jZ/9BTsdjb81fWD5bMxmM+eGQpjvNpYA9XSa4mXBsMAdUWv?=
 =?us-ascii?Q?Nto/xB4C/MwIPWVQajC3SfRjNqp49uYHPck8gf1twRYkt4Jyhd47r808qO35?=
 =?us-ascii?Q?HI/JOX4ShlL2LrsoCPViaFt9Z+hfnnjR+dsJLE0zz1etcAcYYspJeARa1uRE?=
 =?us-ascii?Q?S58QHlK5HfU9b5oBmEFa8gmIQas69gcphwR4O04xAN/j/iJhidFOmvE95G1O?=
 =?us-ascii?Q?V0nVwS+Jy5Jq+9uEcf6ovaNMd7Mn/G7Jn1/TKtXSTbAhaLMaaQHIpZqm+VZn?=
 =?us-ascii?Q?q3JbFvLADadjZMUNKeXNS5VWvXcfZ9z85Vgs2ZOrkNjVFHmU6M6Iliim5tf0?=
 =?us-ascii?Q?FDQ4ZljwXXv9tbjccS8QcQ3wuZQIkCjE+DB6oDMgFX+nkYysLZ5+pOIf/Z1s?=
 =?us-ascii?Q?uzpQWC84Yy6NwliyqNB5hJ4dXyU4jjCK8C4ltQQ3CtQ/9dd3GcFj262EL9Qj?=
 =?us-ascii?Q?SHq6iOUtjbgB5mPhOW6184YhoXrOjNvekP+OZwaj6h8DLvI5gCW99o00PCry?=
 =?us-ascii?Q?0M0hNdxIh0q3y8rSYMC9KmNA3MubrlvmsKAhaxjZh+BmACqYCl1/UycHxGrk?=
 =?us-ascii?Q?wnalXbn3bYnWuuP3cEVZWSEZL4VO1MmlCi00QI+srQFAdOIgfkHQyj2MjHTZ?=
 =?us-ascii?Q?zUiBhIrsUBPwX2xdb9nsXhfQXWVkGboSFeBrW+7mPW/GgwukaI545I9WP7v/?=
 =?us-ascii?Q?kz/TC2KMeV2Qo3X3Qvk+7W+9g80IV6T8dra5RRb4jdH0q3899Ek7az/3xDhr?=
 =?us-ascii?Q?SjZSokRGT29IICeyW0PsBlPS/y+j/WmlOLv9eo85SotEJfRTs18WwMoqAj68?=
 =?us-ascii?Q?V51qpKhFTanmQsahCDKqJ7YG5PCTppx9Npt7W8a/OG7q/BWqP4rfhDmwCjYf?=
 =?us-ascii?Q?c/3gWzo6my3bH2yTT4i8U1pTnwR02NPmCtvaR6kq4FzwDC8YHectcrSsn5Ez?=
 =?us-ascii?Q?3GnsqA9D3ukecapl+eWt3pGziWCKid6K3wRVHKR+wJtL1brb7tC4X+/wtFbl?=
 =?us-ascii?Q?+2l4PyaTKx4eB3DnOAHS/ojNuJziBd2JWf69NlZ1TunxElGl7u9a7ZiBZ96J?=
 =?us-ascii?Q?RPILksbrZRBvRyqpps5McBMoU3IGUWpUumgcScbxjl8+7845+oksC2hwKJBp?=
 =?us-ascii?Q?Eo8KPexLeO46CmpoFx4EFhIYd1SR5Tbkrx3c6RAJgShYlKCe2Z/0FxkvJNcH?=
 =?us-ascii?Q?qc/dJakOBom3yXtXVtEOdEs8XQozeX5YuH+X6J+ON+dxK84LppJY3ZrBoueY?=
 =?us-ascii?Q?0hgeJY46PiUwN3+QNqkFC2IrQW8oyEd60b9UBqWTp12KdvbARe+jkgSp8krS?=
 =?us-ascii?Q?Q4iAkDc0ShjAqvTRwDsohEQuXS1cf7oMSeF/ll2ccrMctLv1Ll96CeNO/IZs?=
 =?us-ascii?Q?E3PCDhRGkXE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HnJ2rLtUuGIPYrBJ1ISEQtWP9P7LFJIcNrfT/WEykyKGGNXByyfJBznEuX2+?=
 =?us-ascii?Q?PqA+2bfrHN7WUJmP+3KZ1BGD1fgY7OurhweTvkiJJM7YP5ZVDdOrQm9DDQWS?=
 =?us-ascii?Q?EeSexDUNN8VPPV0KCYyK7a5GDCJBCPyw0dDO1ZahFIbcfJBMZ4f8aO/RMGUP?=
 =?us-ascii?Q?QuTpvNHsL0f3lGbRwA/gGbvreNTO3obld4xWdMwTC3g9J78GhcKeiJ1QUagk?=
 =?us-ascii?Q?FiaRxpP+0TctZIMT51PzfdNtFEjMH2s/fQAyH/1CSJY/bmimXEf8ldeYB0um?=
 =?us-ascii?Q?OR+nkhlG7aecATyW2M99LRW7DT+b05MDw8N4/ZmlMHdUsRKA8mJyjuQiQ0RC?=
 =?us-ascii?Q?q8JkFIPx8qxeodwpJcxc75BkzxkI1ai+SsRtCEzFG03yWy4S0N2GsZBhxQ0h?=
 =?us-ascii?Q?qSj38Vx6Ihvel5Fq59WMm+XSCGpDhDkP/oy4Aaxbgq4hXfsjO/d4Jzdtvkm9?=
 =?us-ascii?Q?WPFy78m7pW2/dZi5Swb1OH0bvtubyTzCJofa1o1fJmjIY4VSW2+s+EQIixv7?=
 =?us-ascii?Q?GbSowfIjIzAz3kZGlwxst4XUmeTEpKcbCusL3fjpdq/BdCpIlfELR7PX+nC/?=
 =?us-ascii?Q?xte+2/RRInGDSxJauHK4U+knEE+oI9e0BQeh0EDbn4TAgdFZvdIa3xjJU3iV?=
 =?us-ascii?Q?28oLHbwzvRNIv8EgPUgbY2b4+LJaGc09gM3HN+wY9cOdXuzNwI3E8qc6nyx7?=
 =?us-ascii?Q?K40rCM1T60eoWM4VdApf13REE8uakc2AWYm2UcG1xMCenGGMaTwcTjD8KDST?=
 =?us-ascii?Q?fQPSNIHDDQ555uPVmRnOJD6BmFOB/OYwEOrZnDQ/bLxywjZKW2u/FhfIzOfh?=
 =?us-ascii?Q?aMfJVZCf3wZ5q193l5evd+zauNKhe101yG/Uhd0Wq4kZUJMW8QGEL7cvMJLD?=
 =?us-ascii?Q?GkburV19HKDzQ6MGq21ZpeQct7X6ABZCzvXt3d86qljwyUghCDPRDQ4JPS1a?=
 =?us-ascii?Q?ApC7mTU9/2ke5gdG40ZRhTYtf9JkVnes6L86duP864sq+gkttdK6bVummgfN?=
 =?us-ascii?Q?SP19c3Z/uRiN+ybrFsGI3BENxE12N3Ipx0tPNSYLGbk5VjFvg5ryYGeSIiV9?=
 =?us-ascii?Q?CdqAOinht5CQJ56Fg+c7SspoCAaXcnxPY1eXMHiUV7Rp3IesoO+SapTmZOq7?=
 =?us-ascii?Q?yqiZHnD057P4rQw/4ihMmajWGg1I/dwBM3QsCAzF7Ow7gmdXg11LGxVJ8POa?=
 =?us-ascii?Q?VL3YFcncQv63yiR8TW2w0jsYqOYWmjaCT0/o+ye3yRFJngOtse45CeKxA9y+?=
 =?us-ascii?Q?7ZfUAqwZ6J/yxDYsI0/305O8PVHtV8kXEQlMPAtViYiImizTxqZHnAhF2JWv?=
 =?us-ascii?Q?8xwI++YT+N93rwv0UgGbyk7bVzH2RAqhYrR+/+XNu8wQeV3Sau05QBsH/LxF?=
 =?us-ascii?Q?dQrbRKx3m8Y0wCd1ag76jsAHTBvOURnJuisYx5VHp6d1UhhAla3kpsxwOOt7?=
 =?us-ascii?Q?GzGz/9lERVRVZdspLBwnMsc+857ZNK4KISpXko2vKtISIFtW+TJ2bS7/JG5K?=
 =?us-ascii?Q?hfwRrpA0Ec/sY91+943ce+7o2av4ZoB3YkR+4t1dQJwmB+3iGyaGJtzUe/yM?=
 =?us-ascii?Q?k2/A62Q20226FcyI5DjPXAzh+8+ZPNPUt8bcpini+9nnp3PMDH+N4ACAYo4q?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Lbf66Dw0Dstb4uW2shqqHgIDl6vGjosbgj37GfmPpoGCrklRYPVfd0u/727SKJeCW6TO1r6nWtQS252Wkc7xDM1uhuMfaES+um1B0qdg+njtNBiS1rp+MRlBBQalQ22//JW9DQZfrOqrSY2d5E4Soc12QyH4rK++pVi5bNK3H+Y2RwMDGPFXQ/jz7Ici2wcmCC+pupJ+sxsE7ATfKJnBao4S6Nw6um/4g35NfRjVNlMLoKv3xtM6FrNzVn2gGvgwcBf3F+JwGZ2X/jCe1wO5W2pR8hwgIPHphelgppilILnph9PWLAA4RJLFFdjlKiQm50YF7Y5VxBGyudAEVivcrybSz8/IYBFCfgZjcxGnQR6+I9lw8cL1HOrxBsFkYD6UkWufAZwpvRfZKsDaln7NV0NjvpK7mW0+HzlPZULVJg33301hGZUv44JnCXhm2W7Yo5bJHuVKJp4kBTWMJJluBMkYag/Z7l3pDv41EgcAL+/pHSnd4VLQBWxQZDEz3zGaQ49RsyyleQ1L8/n15aQdsTMEuOeFSuf5V60sqA4t0RKmj3xrYUc3N8DfZdbmCEsZNJxunPNJRuxLMmKJA0WbVwsQuuroWD4Bc3zdqR4yIgQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21097126-9c64-40ee-66a6-08ddd5181228
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 18:35:51.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNWMl6qVSs5PDQX95zXfQa2FqCoXp9ZSL419DbJZVliJO9t0WiO8eL6wa5a4Vw+R77YvITYvKdKcQQpav/j33H3nB5z1tgb4cyP5QlkCrTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4982
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060123
X-Authority-Analysis: v=2.4 cv=WMp/XmsR c=1 sm=1 tr=0 ts=6893a08c b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=bM5EEiRleyLCrYxGCLkA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13600
X-Proofpoint-GUID: G25MnBONxeMgDjoKU7ktQaM09BuZV3DI
X-Proofpoint-ORIG-GUID: G25MnBONxeMgDjoKU7ktQaM09BuZV3DI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEyMiBTYWx0ZWRfX2cnVxfvi/Usf
 4wI55dJTKKErayJyPbH70mJnyljr6rYTzd4oUM+5qeqDgflS8EFo/P637w9QwppPd/WhDSP6blp
 EbLjToL7/BfAePMyBz06euGzRMOgnAFSDVysGtFFMLoinrwGFGWu/BRL/SV1EIyHYHQAHXQtYLQ
 RjhLZzW/vzUZeXj5qA2tzAwJjn1J0wxATbA5tHtwbBZgLItgAfGKu1XrfDkNV4devDxkEny9JJV
 ToHLfaoxs2Z8A6AXlsNFzsGrI3k4jTVhaTOYLjG3YHRd2R9xKlezJviasEL8dElAAeIgre/IQCz
 1UQKYo8cMxzd4TRoOeLdgS7FhUqslOvsZhUZCllHkZuT9aeBWex9CZy2+ZD/tucvb/qqJ+OrT24
 Sm+TcD/0Jw6UpbT1YJsA4A2PNCDp+Ms2txu0qIb+BUqiE4onTWpxPDVtFazksQxaPm70OfQ9

On Tue, Aug 05, 2025 at 12:51:11AM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit 35a4f05c2
> ("Add support for pid function "-" with absolute offset"),
> function names were removed from underlying probe descriptions.
> That was so that pid absolute offset probes (pid$pid:a.out:-:$absoff),
> with function "-", could sit on the same underlying probes as
> pid$pid:$mod:$fun:entry, pid$pid:$mod:$fun:$off, and USDT probes.
> 
> While that made sense for those probes, it did not make sense for pid
> return probes:  their underlying probes, all with probe name "return",
> are no longer distinguishable.  Further, there was no need for any such
> change, since no other probes will have the same underlying return probe.
> 
> Name underlying return probes with function name.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_uprobe.c           |  7 +++++--
>  test/unittest/pid/tst.multi-return.d | 21 +++++++++++++++++++++
>  test/unittest/pid/tst.multi-return.r |  7 +++++++
>  3 files changed, 33 insertions(+), 2 deletions(-)
>  create mode 100644 test/unittest/pid/tst.multi-return.d
>  create mode 100644 test/unittest/pid/tst.multi-return.r
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index a633b6fe7..3661f09d9 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -906,6 +906,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  				     const pid_probespec_t *psp)
>  {
>  	char			mod[DTRACE_MODNAMELEN];
> +	char			fun[DTRACE_FUNCNAMELEN];
>  	char			prb[DTRACE_NAMELEN];
>  	dtrace_probedesc_t	pd;
>  	dt_probe_t		*uprp;
> @@ -923,12 +924,14 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	 *
>  	 * The probe description for return probes is:
>  	 *
> -	 *	uprobe:<dev>_<inode>::return
> +	 *	uprobe:<dev>_<inode>:<func>:return
>  	 */
>  	snprintf(mod, sizeof(mod), "%lx_%lx", psp->pps_dev, psp->pps_inum);
>  
> +	fun[0] = '\0';
>  	switch (psp->pps_type) {
>  	case DTPPT_RETURN:
> +		strcpy(fun, psp->pps_fun);
>  		strcpy(prb, "return");
>  		break;
>  	case DTPPT_IS_ENABLED:
> @@ -946,7 +949,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	pd.id = DTRACE_IDNONE;
>  	pd.prv = prvname;
>  	pd.mod = mod;
> -	pd.fun = "";
> +	pd.fun = fun;
>  	pd.prb = prb;
>  
>  	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
> diff --git a/test/unittest/pid/tst.multi-return.d b/test/unittest/pid/tst.multi-return.d
> new file mode 100644
> index 000000000..0f81f343c
> --- /dev/null
> +++ b/test/unittest/pid/tst.multi-return.d
> @@ -0,0 +1,21 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: profile-tst-ufuncsort */
> +/* @@nosort */
> +
> +#pragma D option quiet
> +
> +pid$target:a.out::return
> +{
> +	@[probefunc] = count();
> +}
> +
> +tick-2s
> +{
> +	exit(0);
> +}
> diff --git a/test/unittest/pid/tst.multi-return.r b/test/unittest/pid/tst.multi-return.r
> new file mode 100644
> index 000000000..bf885b28c
> --- /dev/null
> +++ b/test/unittest/pid/tst.multi-return.r
> @@ -0,0 +1,7 @@
> +
> +  f_b                                                               1
> +  f_e                                                               1
> +  f_d                                                               2
> +  f_a                                                               3
> +  f_c                                                               4
> +  fN                                                               11
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
