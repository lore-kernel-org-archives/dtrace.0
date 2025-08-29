Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DBE30CD95
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756493204; cv=fail; b=HlQhjW4MeJWv5Rx1vVn5gZ9dsOivGsm9GT2xxZMe49uf8sJ9rjxS9U9id9K17e/Nyi2vz+Z+p3dcJzBmWrnQGjucKRcG3KxgIU7eEGNl4a1ceNwGtksqFH7akwP9FrdxZNfsBp4WsaJFZfxL6qc46IDeEC/XBwgHupaK2yrleag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756493204; c=relaxed/simple;
	bh=2XOaUTA+Adx4smZdJ0HWgzl8VWv403O8xl1ajqWclsY=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=o06l8FYRRQtmQs8BHpYcDbuHtCn6x3ezmDryrN5W3MIFlVaUKxxNI/k+A2zN9133OJcNx0cxbbmcSjLhUu4FjSUca3MRTHR7HXRp0usY/iB5scpODPVQ0ZAVgH0vFcHUKz0TMYmKjwk06wfps7uSpq8815N3u/Iu73B1LQLetEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=roFBepEp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J9YNuGce; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="roFBepEp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J9YNuGce"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGg1J7024035
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=x7Z6TnCAVPSwIzKFPbKMC9F7nz2uQWTkqfoa62WGgBc=; b=
	roFBepEp3IOQ1W1e2yjh0adHwwVKK+KmqKevVQqqU0MRIUDnQ+diN9LKVDYIaaI5
	QlDJQbagiD0O8SuPobNMyXXPHF6V7Jgqvtaibb+O8w1Vxk8z8dQU3MRKQAMd+ts/
	GCb70rlR37wp3EsAZMEatEWGUy7f2/aJaTafgPd2nDVuFCuJng6F0pgHV0Ov78nn
	3GWq9TZHOKd69qgFzuNZl/mr/9WgpmKiQrf2tLzkfYyT8v2nyFQ4dzyXRyhSIj3w
	TUqx0QUPz8cPowksdb7V84o1L1n8u6P+KSIG+FK94ISwC6gsu2Sv2alqTB449sRf
	x4D5yEd8LpSTv7O3yJjg9Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q42taw6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57THFXmP004994
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:40 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43djs1k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcIp+atlkx0SThLdBWwttfe7Q1nYObQxM5c38F6aTi3O6NCe4h5r6wMGqjuFC0rBxun2iE7qpjl0hNq2KkloVJ68tkuuL+wqIfpVqeYD/YOgToK/9ShESpa/pEm6tsHYtaE2qNfbQXI8ID9aDiXisyWgXs0lfaUjKdWp0W5IxARH/Rt/h1rTxthVl0Hp6note8Ih6B4bfmK7nEkGJZ5dyj6KJcsGM/jcVjQPo3SNVdme4c1K9xOMvagFRdLz7yVSWl8Pcymtmr8tm/p6RjQahR3lqhgXj4bxl1kCNwVmRQBrRX9qpZJ6qMCUgTQS/JswLn19b1UTViv/bl9T8X6utQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7Z6TnCAVPSwIzKFPbKMC9F7nz2uQWTkqfoa62WGgBc=;
 b=klBkvO0rcda7EtmGM8gjEvSTVTUKMHibX65KrOqZbA0OukC9VP7fH+kbUXF6WvY+KVEAimwxjVfxGsdUltyuoJAgOuGjoSRPWYPjKode6nKp32C/UfmYd9jjNibD4eQK1kg4ml4zzbAMhZczYsJfg5yJYu30t0K13DeGmJpvdpWqDg3gPteuyCfu58+mEgMbGQ+yD9CwJTa2ZgjM5Ca2e1bQVVEkwQL+QNaxVbpTyL1fqWUS37yOjZT0neH0t5PjQmJ4pZ1fuSn5izqjZVxJUoCnc3CgaIjMxt9IeCDnUDeKIBRvnVL/OR2DAokFUHhzYY7AHIBsFKrXw4k4z8mrQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7Z6TnCAVPSwIzKFPbKMC9F7nz2uQWTkqfoa62WGgBc=;
 b=J9YNuGcedSMA8bo5R2r/DmMuajzjXgusZIAHixciTUrmMx1+WjKpiapOY599AJjLmYujoU/611m9ziT4ynIP1BJoykREBt11QtXr5Ih6pxbh60CKIsfQl8JQv/IyUYAhI0EAsWT7kdHJ2h0rYIFeO5iXdkE21dbdZH3xzByXlWo=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA2PR10MB4507.namprd10.prod.outlook.com (2603:10b6:806:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 18:46:33 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Fri, 29 Aug 2025
 18:46:33 +0000
Date: Fri, 29 Aug 2025 14:46:32 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] printf: fake type node is only needed for aggregation
 printing
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672F55FFAD98804D8BEBF08C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA2PR10MB4507:EE_
X-MS-Office365-Filtering-Correlation-Id: 49abd880-8a7f-4962-bbe8-08dde72c6046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m19Z1B1hvVzbt33zx5MZEwexCHhF6ZQV9I9ImTnB58emEosJYnvPyTYeHOvV?=
 =?us-ascii?Q?C4YhYqL+bjchgT2j/tFRFK8fJBOZfDr/Z/JIISmxEWKS3TPsAxYg7Izn5syp?=
 =?us-ascii?Q?wKz+8d5oZKsF4BgWIgljlYODEU7pdBwXNtSuZqG9IP//D61tHuVtgLqqPFZ3?=
 =?us-ascii?Q?3Q/FvznwUnsb5FY8esJ1lRkgp2h8Br3wGSRFJKup5n271kiap+hsl9mzQn9m?=
 =?us-ascii?Q?SgreXrmcXq+xufALJrjL/JUi1pkZAh1bRZCIHEN83yjb1X2T39+Tou+2Metk?=
 =?us-ascii?Q?lgnq+1p/j13dmqiemwATHD4Ejqv3cigwqvXxKJPyocNQrgKNzm5TJDMq8TXz?=
 =?us-ascii?Q?JJuCp9CRyTn5KFPsx1jaQLj5gHFc+QjUU2c3o5Zos/yE0qfpMW6yT8NI37e9?=
 =?us-ascii?Q?bxUJoNHPGxMAsfLz51VHjkSav6QnVYMlzKyaC16GNhMVfuh4P8PuaSC3x6AI?=
 =?us-ascii?Q?sAvTsoDSkX21H0nX5yKg5ybqjhwxBM/Vf6ckTKv62qhmQkFfq7XCTsnnmrX4?=
 =?us-ascii?Q?i6gjqw6xXZYLmiyG4L2GZL1A6KG0LbLbhlvBCk8YUPhoBOZ4lFenGkxXVHfS?=
 =?us-ascii?Q?wxI5QhsN9Nd69jZJrK7Zd11j6KbZwF4YGozS8Y+3QfIVomjTvm+lZouEoZiO?=
 =?us-ascii?Q?lMqTiObYdN9bTh1MisIwDO/NhCKaEnxvHQAHMoAnRhsjmzrmmUUxrAjnozyG?=
 =?us-ascii?Q?56/ALUm7tdBLSHVS32FTfLCpmfYYPxr789+FZYiJcsjjCbUMXuKcXxQRXeU8?=
 =?us-ascii?Q?9v+tCvF34Ev0diaFSue9KMkjg84ZgAus7LT78nISsXhMGdq9P8GF5X0GQfMJ?=
 =?us-ascii?Q?8uF7ELQ3dLjYoYbHAL+qJjpKbPfXNqrkb6a0AturnceUBn9DAbTkegfrQMaW?=
 =?us-ascii?Q?bYSF+lVDkzpj95FU80fhr3QiJ8BseavsPCIknoT01onpHUSZQIRhriD6S3yE?=
 =?us-ascii?Q?6NqfaVt9sE1cv5B7PqHh+uWkgijJ8CWchKawAfdsUZW9CNyuQvbUQDPzvpy+?=
 =?us-ascii?Q?JnaAmkHPx5Y6k9eJhkHZpf+cU2OfntFDDHWw7xGmXJESnYyo4UD24Vrgv3Cd?=
 =?us-ascii?Q?wiPrMEZCNw1K0G8ipRYDB1qj3NSj3EeWnJEJyJQ1qtmYgZQ18YHoLywxOZyl?=
 =?us-ascii?Q?ZSj5FyAe1MSPiEg/hvvLZk3nqD/i327pklz+bXIY56bz1N/JdXvQZwX205DP?=
 =?us-ascii?Q?b8gV7w8i1DusHwWjPB60mJLppqQB3TmIAt5yJjS7IqVX9ngLWHShLQ+ABXNM?=
 =?us-ascii?Q?60tevcv3seMj4DeFhRaNzfRFcWOq1pQpjZSH6X/A2oTq5q/ETQ1O/PQI3NMq?=
 =?us-ascii?Q?PhRgB7V6sHRbvRgqoiYkyjMjcPplGctracUhyNVGBguf8Ix/OoanCIRTL+1V?=
 =?us-ascii?Q?2AisKwEpBRg8UPL023QUUB27Q9Sv1woNCVRmo73TmM50sl3nhj+W91itoDlj?=
 =?us-ascii?Q?jGUYoStCmkU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/tYhixiCf2DC1HJ0F7U+toWbmyoWbyHCFHJ9zkySI4b5l3un93pxoKaBIPKp?=
 =?us-ascii?Q?cDEBlD7ILWdCGINBr6NZbcP/5MQxxZsJxfyMdCqRohMe7S3/tXHcknR1aLW7?=
 =?us-ascii?Q?W9XUmZWae7x3tArhSXCVzgfMULh2t9wX5wPJPV1Qu1SAW1Z9M4nCESxxASEh?=
 =?us-ascii?Q?dnnNBwlGFkqtEjLzNREC7K+1jS50uGdGxdcFRBTrxsu7qhJ3j5O2esuSTKaw?=
 =?us-ascii?Q?QqJmxVJAWBcEfPr/kTpZYN+Ki9Pg9jjH8XGQ7P7n5TDXRgDsU0/T/tNik1uZ?=
 =?us-ascii?Q?rfCHt31gj6opaRrE2qGb+5dC2bJYQM5YC7XOYzUPXXywWiFgkTY7elpb8cSV?=
 =?us-ascii?Q?f7WeVtW1AudAIIZqIYz/FnOBMIBGFtEi5xRjGqR7uCw1lKME9t1XcWo3kHhi?=
 =?us-ascii?Q?fxZPHuo7aFqdgNdiTlrZkU89cuTYzpbhyznQGjWvtk4dTuORTjUavKraQCiV?=
 =?us-ascii?Q?Mq35zppr2F6yipaQlkKDxnJq8/dhN075MvIn50fWlRtx018htY08S8kmAhL1?=
 =?us-ascii?Q?xLQhke3ZffiYabdTVfoWG2BGFrWZEZ2yAuVoRvUQF+uOynPH1/KSnAYciNI9?=
 =?us-ascii?Q?FRPeTphcnG/n6pQkxL+fbCG3yDxyBlo4X4VYFjU85WZQPzaO/UzPpsdC9PTY?=
 =?us-ascii?Q?tiCdCAfb0oHTVA62AQP1ZkkdJLXvI0bZy8RacjoszbJaEkw4P/iEPJTMc81f?=
 =?us-ascii?Q?bMTSUC4+7C2Ut/lCVly1DbBmTNuvwiBq0q1Nntaw4pLWCbOiGJKOt3eZAjIR?=
 =?us-ascii?Q?X5gI3guzfHtsGWb2xNVuuzD821ecQM5K2Mi4v0luGORPeQNpS93bvuBhxfKB?=
 =?us-ascii?Q?/9lf6moYjrNeJ9fY6iCU+a+t6+Sfu9DEVsKyY7MO5vZ4vZmqYn3Z54rN9ADv?=
 =?us-ascii?Q?XZjPKFZp57gFYvkrirL1kfhnBZnsKpq4jZNHeC36HSyDryD8g3MjXivmiPRD?=
 =?us-ascii?Q?nsy0CYplrqdScjT6el24J0wX2fAX8BRs3ry/edOsd8hPR2x822+vsDAk1iHa?=
 =?us-ascii?Q?1pQLF8gPCe8xjDtQosBiPHcFRPBwgkQQUTukb6SuPyyejKaz0P1fgcedp2EI?=
 =?us-ascii?Q?8SBouB+eePH3YF482BjpGHY7f5HXxqi7MmeJXlo+5xTS3EO4OLQQbiP3SuLj?=
 =?us-ascii?Q?pd8cxFnkos31vRY2Pt8QB8hei0WIlE0yg1YsBlZOlsFeZ22zRpQGMB6t+k7E?=
 =?us-ascii?Q?Q68mWjR4h7F/0ZPsKFE9ewwd5+a1yxAJXeg73ja+1d6z5AFjWOxFjoyq5LCE?=
 =?us-ascii?Q?/gIIBjJm1RWwX4FhI1bM+dv99rqDTNy/07s2JYgxqSyLpD1s8/znKaVyZZUH?=
 =?us-ascii?Q?uKcx1QHFtzhTtiWr5t813yg84/X31R9rCwsyjU/DBKD0E+GzC7pHECoGGYEd?=
 =?us-ascii?Q?nAkJi06L0Z1l3ISKXfsPevHN67Ulxzl6NMIz4zSopGB69126t/ZxTBCtwNPx?=
 =?us-ascii?Q?zYd4siSdJsoOfmenrmBGGj4catzeaBtS9oMwycPp08lF+MLi7rYLbJ2DECOw?=
 =?us-ascii?Q?Tb3VdDeuowYwmT3pHO5YXjAysCc8MH7jUzXFMM9MPPgA0BC8Vr3ssYHHkYmG?=
 =?us-ascii?Q?Tbthr5rXaeGz8H5LYtN0JeyTDHzhMUjSEeaYv7MPymI9roSA9Deeb2y9HoVn?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	63Nf8iTz3XzsiTZD9RDr3ocW6KxAtnKNvI1DXNDnY27BxbWr3lU3Ex22JA8wT6qEv7jXrI+22LgukBo1FV/ej3rQEiqwLs39W97Y0U1KiCKBAL3SIsc/XzX0Dk1Lb4GQ0gBT+ghSxdC0vz8vmYRLiqFbq4loTqzFv7ReUVBU729yXBG4vPStYlAYoBvJ9z+a/ZdKEwA6w6S5qIjq2ymwj8gYd41JAkBF7Q8yAdoiAEx1iubcotb7mGAar65BYWZ1fRgD80pPCts8GjbH+sNC8S5un3v/LMaoQlphRTFk+j7FwpjEShwQ/Ts4rUn3kcSN83XJXgAHmyK5mGymqEJYN00QthAwOM4rSdjH0HbbnpDw5Dis0le/lQd5OOxSS/QOfGaGm5K5Gn/jDE/wyh1lER16JN0mkt8GbisbDyudkLCmaGtSl8PWLFNLKj7/b8XO1MrKcFXIOMg3Rj3IRk5VRjPdnUirnWr6QBLUJmYA3a4hYCSbWpPkaHp6BQtcMK5M3OOgM0TouMqVxmumNRnOyN0o54mVLW2i95Wi+9u35iXyxxIYjI0+9RiOrLhwtJqH5AgrU/gCH1AH2Bb/wQmZ8oHwYFm4DVU6Vdf5j7oyba4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49abd880-8a7f-4962-bbe8-08dde72c6046
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 18:46:33.8452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97+N5Gh0gofTYgYHapoeu3BTSk47aSCkDTn9YppoiGPudxpesesbnNFBH7bb5Hvv71AV4MX7CSBVYVU9c4Z/uN/cL3vjWDoR2E01TQUKfZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4507
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508290165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMyBTYWx0ZWRfX5WQUMDCabBx8
 8cHkZoPXTgJT9xaXVKThiH73ABaJyJP5n3jl79A/6xNgl4itmlDO/3WPtg/Y7sVrCxOo2Wz8iR6
 ztnLWH6LWlvuysFOUZUAGAfgkDcMCVp+CO/yY0rYBvCZ/99ltu/+JVRWiHp+Xxbh6qCbLU1RLzN
 fWBTDZibTCs+emNIVpDfp3vd6AKerwm+UERbNrdsVR1r1eqfe5oAbIPqDH/xMrOD/Hob3YEXsuK
 iUOT4UIOVxNaSyN8GbFzqC8hqdfpZ06wYYiwEWG4BDg4AhLRwPUL6ELr5io5HLezJv2mwgdu3UI
 HGCaEUZnmiotNhF2ssErC9Fr2K7qbAfBoS3nAqFG5YUuQ/M4Jf/czsZxMMM1mKmglCOkrgNQplD
 uxKhw0YU
X-Proofpoint-ORIG-GUID: RNTZaz8F2xi-usIY8foOJQrYcqezFxtb
X-Authority-Analysis: v=2.4 cv=RqfFLDmK c=1 sm=1 tr=0 ts=68b1f591 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=coosVz9q2F63BPRezwwA:9
X-Proofpoint-GUID: RNTZaz8F2xi-usIY8foOJQrYcqezFxtb

Regular printf validation was passing DTRACEACT_AGGREGATION as kind
argument, even though the action was not doing anything with
aggregations.  Pass DTRACEACT_NONE instead because the argument is not
used in that case.

Also, do not populate the fake type node if the validation is called
for anything other than aggregations.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c     |  2 +-
 libdtrace/dt_printf.c | 34 +++++++++++++++++++---------------
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 7af3dd44b..77699c786 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2482,7 +2482,7 @@ dt_cg_act_printf(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 	 */
 	pfp = dt_printf_create(pcb->pcb_hdl, str);
 	dt_printf_validate(pfp, DT_PRINTF_EXACTLEN, dnp->dn_ident, 1,
-			   DTRACEACT_AGGREGATION, arg1);
+			   DTRACEACT_NONE, arg1);
 
 	/*
 	 * If no arguments are provided we will be printing a string constant.
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index 21ec74111..1e01d4687 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -961,8 +961,8 @@ dt_printf_destroy(dt_pfargv_t *pfv)
 }
 
 void
-dt_printf_validate(dt_pfargv_t *pfv, uint_t flags,
-    dt_ident_t *idp, int foff, dtrace_actkind_t kind, dt_node_t *dnp)
+dt_printf_validate(dt_pfargv_t *pfv, uint_t flags, dt_ident_t *idp, int foff,
+		   dtrace_actkind_t kind, dt_node_t *dnp)
 {
 	dt_pfargd_t *pfd = pfv->pfv_argv;
 	const char *func = idp->di_name;
@@ -980,21 +980,25 @@ dt_printf_validate(dt_pfargv_t *pfv, uint_t flags,
 
 	pfv->pfv_flags = flags;
 
-	/*
-	 * We fake up a parse node representing the type that can be used with
-	 * an aggregation result conversion, which -- for all but count() --
-	 * is a signed quantity.
-	 */
-	if (kind != DT_AGG_COUNT)
-		aggtype = "int64_t";
-	else
-		aggtype = "uint64_t";
+	memset(&aggnode, 0, sizeof(aggnode));
+
+	if (flags & DT_PRINTF_AGGREGATION) {
+		/*
+		 * We fake up a parse node representing the type that can be
+		 * used with an aggregation result conversion, which -- for all
+		 * but count() -- is a signed quantity.
+		 */
+		if (kind != DT_AGG_COUNT)
+			aggtype = "int64_t";
+		else
+			aggtype = "uint64_t";
 
-	if (dt_type_lookup(aggtype, &dtt) != 0)
-		xyerror(D_TYPE_ERR, "failed to lookup agg type %s\n", aggtype);
+		if (dt_type_lookup(aggtype, &dtt) != 0)
+			xyerror(D_TYPE_ERR, "failed to lookup agg type %s\n",
+				aggtype);
 
-	memset(&aggnode, 0, sizeof(aggnode));
-	dt_node_type_assign(&aggnode, dtt.dtt_ctfp, dtt.dtt_type);
+		dt_node_type_assign(&aggnode, dtt.dtt_ctfp, dtt.dtt_type);
+	}
 
 	for (i = 0, j = 0; i < pfv->pfv_argc; i++, pfd = pfd->pfd_next) {
 		const dt_pfconv_t *pfc = pfd->pfd_conv;
-- 
2.45.2

