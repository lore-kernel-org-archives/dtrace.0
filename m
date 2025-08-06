Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04E635898
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754519169; cv=fail; b=qyLHEKMMlvxSP49/PuO6CAwlqwILea8T5RVOapxPvSqwNbvcEHPnZk+0wVDbu8QLPVXlKR19y99aGuQRT8zG9rM5k5G5iUDfXN2RF2+/X56xcHe2fwRglyjlZ+vkqOYPRhzNqiW92O4cZZuIk3G+0s331LnBA0/BusZ4o2cUppw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754519169; c=relaxed/simple;
	bh=164dZxais6ztqo/4V4ESvPs6vdCo0k250HB16dROXYw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=HF0aJN2fPEYsBTd6DB2U0fMJKOzaPdUR+hgX/wjWSWCmbq0TvFb71xQ93bMg+iDtrH3CFRVCCg+Imqy+rDm1B/WN+2o7OWS9n69EfUwh4adoxOwwVIibsR5zr6pTL3EZtLKxAb4Hx8dSjBVoh5Omp8dLfCkzbMVuN6ubXphYZRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nU2MUZeP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MivDtg2u; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nU2MUZeP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MivDtg2u"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576KRLvE032653
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 22:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=DLHpmkYJra0+tXBZzaTOBYPQ0Se9fXlttojuuXRgXMY=; b=
	nU2MUZePtTjAKMMl33D2I81b489VpzgA/lygNDOJK167UD89iX5qC+EWap0iHPKZ
	HFA55Urtb9f7+Wb0PqNHTIDr0c1z2TjDSWtPC779oMEe91aG/PbhXa9TUoewTeHN
	AIlWdz5WYPfDbNw6Un/HkFJJXKEoKofwSIsiEQecXENHwmwssANiPcCjaLhDo7Pd
	Toijqj0lNYT/tkyPn+VPt8LdPUU+d3FJgTS6T+/J/yUNvS0/jDzzUhUjDNxcgCEI
	s8Jii0kv2rw/yv3Jk/o0oSYFrcCBrmxqcETkj8dZsp+gecckfp+UklwnyNPRZ/F/
	KkODeWexLUp4VILkn558ww==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvh2req-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 22:26:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576LVXV1009704
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 22:25:55 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012037.outbound.protection.outlook.com [40.93.200.37])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwmm47w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 22:25:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDq4nsQAHAmByxACXorQ6121XPpvMnKCftbSdEedJ7uK/4uFivhIerwT4V9aDBffjr/dDNPTZTCDIkaRc2+4Epj69N1YbhIalLccBbQl4bwgbFepzKhZS1brQWkst1s0FgyWkjWbdog1h8UOklXtPz79+tgh3a8tC69l42vpoDee+m69Qx9O6qbQSeWApf3PTmY67yHaZY/SyxFOTnnI5zsmXvBpuDGYHJ+/LdkkHZ13PVaxjHH7brIN8zDHWH1tc+iRp1wnlVFWrbmNe6G3L041x4Eono+4xbbXrMMJbRPfUQJflVeityAHliO/JKTRGhmws4TuIou8T32mAzqmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLHpmkYJra0+tXBZzaTOBYPQ0Se9fXlttojuuXRgXMY=;
 b=CH5zbdQVd782fRRackZPtbsOS3scQj6f3QdNGWRHoyRZ8Bf1dlmsrsTLAVVeJbrOzkH1HrAJY3o1nN7CDIPgf8DK89fII1IXvsrqPEQUltjdtQXqc3oZleslxZMa8CqSA8SYTUqj79+pbkflWGCWzLdkG/15gX+CPPzbeqENka+K47qq8B3vd7E8yOoj4oKUXc+7qkmKLiIfuTJJ9U1JQ1Yk5fDCW69KhV6xMpK8ZpUxXTdMwMqonTws51Vf8QId2diLcLZg6rZAa9RTjbFIc2j3K9Nea682xXmryZ4slOP0CYw61vPQbppT/LIxfEAoa8ZoI4aHzHb0bSns0XZcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLHpmkYJra0+tXBZzaTOBYPQ0Se9fXlttojuuXRgXMY=;
 b=MivDtg2ur9Je5nxW71ovX9ZkX4WNtYATZyekCkaAy4/gUAIFbkPY8FzH7vfz28PxTJsaIPVEPOuHNlefMrX71atQli4jhcl6Kd/c4Eftdq+bLZHT+vqsD8DNIAy6AKSqDzzWIjKUSqCChSrIDcsW8H/4vWCxz23aTzEA5AeyZ3c=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH0PR10MB5194.namprd10.prod.outlook.com (2603:10b6:610:d9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 22:25:52 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 22:25:51 +0000
Date: Wed, 06 Aug 2025 18:25:50 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] vars; ensure 'cwd' and 'root' work and test other inline vars
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672DE6507A2E9026B67D8F3C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH0PR10MB5194:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba0e52a-bb90-40e4-0dea-08ddd538338e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xcpc3Ci4PGeyAUtMXNbQ9T4LrHLpieO7wZIuNcm0jE0U/rOKR41mKz6MZe4f?=
 =?us-ascii?Q?qoHE+9X1UetaFlCtVin0J4zGM+uB13OKTLaKaNKdkYxfVNLpZSytx/nNMD45?=
 =?us-ascii?Q?SGuxeaynNxiuo7dtpr7ovQOt8vszsBEcFsVQimnquT2vk8p4LKE2bDYHmgTq?=
 =?us-ascii?Q?VklpYmsEwMdWJp2sh0KhQYc8e2wuvnQJDBqXpPGHpRl6O0lIKNqrIbeN7Zxr?=
 =?us-ascii?Q?hJ5dvOcoMsUfewh3GFttaipubPVA0l9paC/DKu8hQy09SvwiiaDn6ad0D2jz?=
 =?us-ascii?Q?zlfMh+7JG7zvV0tvRJFtK59pitY1YuglR3IVl7b66jC0T+VE76mJrWW9tuqT?=
 =?us-ascii?Q?kEBs9AdTjOj3AUXeamGvPvcC6MLn3m3jz9lUJlJwYOValvh0EBYgFbLleN/p?=
 =?us-ascii?Q?ef8kJYYVGaHvu95bsJPyJzZvD6SRUfSb8k68kXJLgVc7Km5gXGM7yFjFjEJ4?=
 =?us-ascii?Q?/zfFm+IaBkLGkmRFhqYHpO+N4cLIyOGoL3+DOL9s1/gUGyM2pgQpHXVFA9ES?=
 =?us-ascii?Q?vVvQERV1nTvSX1BS1DLyY8Zj6CWQORg09YsDOLeb5udv3xhM+AZHIB2psa6m?=
 =?us-ascii?Q?eNSq+zTCx/tjF571yNwjNYBEZFVp34Kk8OqXbMX6lTSYhO0U+Qr6rGe1H7qM?=
 =?us-ascii?Q?jSmcDKN3F9GgRwM7TaE4chWOcXc4xp4YEqck5ZF7jTKQMQ3vIMe7WY9/pzd1?=
 =?us-ascii?Q?OHUcNBY4CCPc1B9ZVBv0N3Wt7MxplecjbwrAFRyq3k5xpixSJs6PJKxVSJ8A?=
 =?us-ascii?Q?VQc9Yl72AZmzHP9l8uQQ6g/t6HyjM7SCvv0nbrSOXlbzhHYRPlTk+yapXqq3?=
 =?us-ascii?Q?uE+xG71UIX9Dwks06+khwxmbgocCWOO6S3gJJgys3rD8E52EgMoVtmEw+VoD?=
 =?us-ascii?Q?1tovlZ2wOLZ8T+anFoPUVovVBnu1yWk7KaHHtokxde5MDy8MZqPJlNfV6Kjx?=
 =?us-ascii?Q?DZmcPMXFR58f9T6tGFkGipBxZ9b/i5aFZijc1lwfgeXD5xzIFpGxg+LeAZOQ?=
 =?us-ascii?Q?iCLOPX9OSwwZvMgRTGFOyiAwEyO8o25RCWSclggKYkcfNQ0iI4vOS4PrBsuk?=
 =?us-ascii?Q?pfT622SA/clarAyybgDkuoU909ggOWiz/ADMC0thK7FS2NKz+6ozWXDcsXfV?=
 =?us-ascii?Q?p/S5nRxBblCC15NZVXuiXwZShtEhP0BpC1KLe4p7jx99n7zuCtghgd+9tiG+?=
 =?us-ascii?Q?R+HspvguJ8wIsWJ2babgf+Hu3zvguVRdpqIcdszK+SAx9ovLVRaP3fhPfret?=
 =?us-ascii?Q?GeOz+floNEs10XJk9JTPeKMHBUR+E5BGNK5QOoKaXA2Q/ZAc5K9KLiucAZps?=
 =?us-ascii?Q?Zq783uMcGms9ATD7S4Ic8DQwxnvuz3eG26z3gA9H5lDEmvMSlDgRcES4fZlF?=
 =?us-ascii?Q?Hek2Xpr6pgoqqHat0OdYYP8E9FPHvnesBzM3tjqRZAB6tWgVDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xjw88Vo/mTHAbkdksCV5Aj594qEWS5IvGqHb+5H9i2Hp+lrPaShTReXIO2di?=
 =?us-ascii?Q?qoBnHUQ2FZj2ysJsNVIKkPsxJcN5y2R/Sq7qOvUhSP7UvNzICIGeH4NcQFPo?=
 =?us-ascii?Q?wYtKMzjBZBERp80Q/F9NX0h3q3MXGFLQmKABlwSszTmP4QzynIHx8Ejqa70T?=
 =?us-ascii?Q?C8ylWPjQY2uZvMUrPH3S9XPzMQ7nvDQnk6/Ropx7q1AnUKzPPYUKv11dsBAH?=
 =?us-ascii?Q?z/4kg0hKlUom0Vpt8jKeMS4w+c34gViXRFhXJ4zq/MeUkIvYVyAj78Vi0KK9?=
 =?us-ascii?Q?UotDYC90T1bz41jHh71V90BbSdAUfawZ1NT7EIbCBjJor/or94v1iNTFyVzd?=
 =?us-ascii?Q?XTURFRWZVDImBMoGQPh97bG77n/YsW3E6P1TKXMQxAx8y1cX/RxGmxc7EsYO?=
 =?us-ascii?Q?QDYRkn5zzahuo/LefuWTaw/AeWHPzvWc4ii4n/UZOLldh2uZRJUMbZNDY9Jn?=
 =?us-ascii?Q?h8kq8LACtSF/bd+PL8AfhrzkbClhAoRsxDn4vQq/CimkcOnjT/ZZfaYReiAA?=
 =?us-ascii?Q?CHCiI7pm+GjGPP3T7WcAb0+UZjijqNFJlx97Fk4TJijHiTnKq8wZuO86eEz1?=
 =?us-ascii?Q?Nq40gVl3fX1r7/XQa2iDsp4LYs0sdkndwH8ndtttD4IC9Wb028yCkk4jNQD7?=
 =?us-ascii?Q?nndFUCIt/zyHLg9yDYisg7kFEZttnTAu16D1cG4Sfph5xxk8ZA0fPXW+z1YZ?=
 =?us-ascii?Q?Q5NAcY725BdW+f1wc5UtTLKup+zCh45CiW3Km08i1GfTwNRRN38BmQCznCoQ?=
 =?us-ascii?Q?iuXVvD2I7lwX0PfnbiHcxVS5YyeXhQ5giT68XZgL+wc+O05Rmgw1tF9J8YtQ?=
 =?us-ascii?Q?4MzsmjCU8sLXXqIQplvQmki7Vd9BxHk7dTmGGBb5r/3YQOd1/vY+dnv/szoG?=
 =?us-ascii?Q?dPsy6xQ4ihitmLqlBIpHcvEiY32jUHNxnahmgWyUQei6p1HlvazUTNWVsqZ2?=
 =?us-ascii?Q?PSiNuVQdz76Cjo7vwsb5+UiHXZedsk52QxrC7G+ZP/3cyVO3eEwfgFKXX5Sx?=
 =?us-ascii?Q?cpTHKaOXPiyj7zRPN68C8Tw1pZRIfz76AP+BoAcfZXGLQQulbLjGKkTlx2t9?=
 =?us-ascii?Q?TH/rRdig3nmXN6zFN+KgWcelFeaMEgOtLMGYESBf3/vEOEiDbgB1iZDsiQt7?=
 =?us-ascii?Q?hv+uIC0bGVWK1meN0CJ8gbeEXXE3mXt9dx2t2Uu8BFMUH9QPHB7gxg7XhJrd?=
 =?us-ascii?Q?H7yVZFJxLR6UVAak+7zvHKhG65gTkWqBdAFzKBLx4qplf2UXgC1TMcJlU2AM?=
 =?us-ascii?Q?EGF61y+j/dv5B6BN+UsDhf11cNgGj+QyEQ1QRiGP/n4acRCwLmx1HZqUKxYC?=
 =?us-ascii?Q?PF+qeUTxks+oIl0BCx3Lf2URYSRcZKPBsehJurBcW4gYoJmjbeewpUuUGVxz?=
 =?us-ascii?Q?D6ABlQsmT50wng8wUL/cgEQGNxPgzN4wy3LwMnmjo1/bTX4642RPxbbQIPZ9?=
 =?us-ascii?Q?DzZO+75nU8qOcQA/Umobxf2Rm0hR+tSv82lhuvxDgeaQu0yh/JwB3XXjpON2?=
 =?us-ascii?Q?WmSwWmZC8o90kpRFrLF5CCS37L6UY08uhR7U15hU1DNJEKXYFGT1o5S49ajI?=
 =?us-ascii?Q?jc0HudtvYA1fLDfmyiKStRr0KDQmFfE8ZN7suOz7WBToHfkXcQyPks3hTn7h?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s0sMPeiXCtU8X+TT6cTbb4M7Ddxu0Gih6ZKmY/1dP4lx9XdVxHhkHVm6MgJTKggZVtY/xtVha+feAReAE6Kmtt4heO5edFMJ3L+NiyRG9ZFjI/1feXPx+TFo3y+DkatqxONMZ+Bgf+Bl8K4bQOmepwU8pwx5uQxa+bH7vENWFsSQiFyGCxDzKVgPU+gILCWT6X/oq2FA4iEVlnFQQsiIizUNYdKnJ7L5QSuByLUg6c6PMlzhANXPHR/VK3RhctP7UmN72QveV3EWYo1ak+n0Er5WGbLUeAPFfKb8SLTpmOmGh/19+jYtfkbGzyz964Yg7Njbv6yMpNgm9BhJM8XgRAma8IyL5UqeTtn/HpiXnX6m9VsWbceHl630xchJ97sHdkl/GiDhsBoNgcGoDcpDVv9YtHjhnv1EXKHmPO3eq8CwGT9aVn8LTL939dJnHFZKTfOiLkj81vnn68fvKR5NK7w38EsBk2QObcDF00ffba8O52m4KWkz+EEPGntKjXpXvaxMCu3Bqcl5o/eczF7ZaWMKSkBBJOxSuVOZixYUooBx+7xW+QNVp6A1xFKZsqkhIQanoXPS7Gz+7//Ub4BA9Yv4kMVUXr5ig8IQQDxytoI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba0e52a-bb90-40e4-0dea-08ddd538338e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 22:25:51.7647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqBBhJNHZvf2hEIbjAbLbnHDyPEBhgNh5ALrl5/SE7hGPm6jA80Rt29aVFRopLJN8dtoVtDzyvfQd1LobJFOLXH+Gl7MZqPKEHO+OQTSOEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5194
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=974 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060149
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDE1MCBTYWx0ZWRfX6EWG5H2YrmCL
 wo1hCpPXpwRS3RhneVuVWgY1KIIiQtfKjk2VmkFA4aUd4JKVm5PLl4qujO7uEVuWMCF4auWQygj
 kidvOReaGreGzD/2umsWbkamMjoT0m4Yj9EhUAxfqO2tYUcwwUKjstaNDTQHbMF0IOX8YPeuYMX
 8PGOGKJO3S9wHI47tv1WL40YDInin/xhXcRHuIxsuZBLASro6RKCDy8ef6zuqZSfsMC/mc22IDA
 IXSJ/6qdn+ti1fS+pvgFvK88l/xsAJzqrYjGmUJr/+coXoSWB5ydB7yhG9ny2XziZSFP7wvX7Uh
 e9KDEIMVwzROARCzOQ6RW4nQSfO3ktWYQ4HCw6Kw5ezNe4QYaW/LrcCrjQi8IgIwhxaFeMPeGcq
 TTXgCcpHhhwgpso9T1bBnrKBXXEKyU7IJJSow64mHXnODJosg+JOJqh1ueattvleNJMdWArV
X-Proofpoint-ORIG-GUID: NboYrS0jp16EfxNqhRqJ4MS3olEWPQ2L
X-Proofpoint-GUID: NboYrS0jp16EfxNqhRqJ4MS3olEWPQ2L
X-Authority-Analysis: v=2.4 cv=Hpl2G1TS c=1 sm=1 tr=0 ts=6893d67e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=MFhy9qMVOI4BBRy5T9wA:9

Inline variable declarations that provide a tstring value were not
ensuring that tstring data got propagated correctly.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c                             |  8 ++++++
 .../variables/inline/tst.procfs-cwd.d         | 28 +++++++++++++++++++
 .../variables/inline/tst.procfs-root.d        | 28 +++++++++++++++++++
 .../variables/inline/tst.sched-chip.d         | 28 +++++++++++++++++++
 .../unittest/variables/inline/tst.sched-cpu.d | 28 +++++++++++++++++++
 .../variables/inline/tst.sched-lgrp.d         | 28 +++++++++++++++++++
 .../variables/inline/tst.sched-pset.d         | 28 +++++++++++++++++++
 7 files changed, 176 insertions(+)
 create mode 100644 test/unittest/variables/inline/tst.procfs-cwd.d
 create mode 100644 test/unittest/variables/inline/tst.procfs-root.d
 create mode 100644 test/unittest/variables/inline/tst.sched-chip.d
 create mode 100644 test/unittest/variables/inline/tst.sched-cpu.d
 create mode 100644 test/unittest/variables/inline/tst.sched-lgrp.d
 create mode 100644 test/unittest/variables/inline/tst.sched-pset.d

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 27919bbdf..707c3fbe3 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -6954,7 +6954,15 @@ dt_cg_inline(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	}
 
 	dt_cg_node(inp->din_root, dlp, drp);
+
+	/*
+	 * Copy the result into dnp (register value and tstring).  We need to
+	 * clear the tstring from tnp once we move it to dnp.
+	 */
 	dnp->dn_reg = inp->din_root->dn_reg;
+	dnp->dn_tstring = inp->din_root->dn_tstring;
+	inp->din_root->dn_tstring;
+
 	dt_cg_typecast(inp->din_root, dnp, dlp, drp);
 
 	if (idp->di_kind == DT_IDENT_ARRAY) {
diff --git a/test/unittest/variables/inline/tst.procfs-cwd.d b/test/unittest/variables/inline/tst.procfs-cwd.d
new file mode 100644
index 000000000..c8760f676
--- /dev/null
+++ b/test/unittest/variables/inline/tst.procfs-cwd.d
@@ -0,0 +1,28 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The 'cwd' inline variable returns the default value.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(cwd);
+}
+
+BEGIN
+/cwd == "<unknown>"/
+{
+	exit(0);
+}
+
+BEGIN,
+ERROR {
+	exit(1);
+}
diff --git a/test/unittest/variables/inline/tst.procfs-root.d b/test/unittest/variables/inline/tst.procfs-root.d
new file mode 100644
index 000000000..276731c24
--- /dev/null
+++ b/test/unittest/variables/inline/tst.procfs-root.d
@@ -0,0 +1,28 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The 'root' inline variable returns the default value.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(root);
+}
+
+BEGIN
+/root == "<unknown>"/
+{
+	exit(0);
+}
+
+BEGIN,
+ERROR {
+	exit(1);
+}
diff --git a/test/unittest/variables/inline/tst.sched-chip.d b/test/unittest/variables/inline/tst.sched-chip.d
new file mode 100644
index 000000000..c1c314149
--- /dev/null
+++ b/test/unittest/variables/inline/tst.sched-chip.d
@@ -0,0 +1,28 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The 'chip' inline variable returns the correct value.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(chip);
+}
+
+BEGIN
+/chip == curcpu->cpu_chip/
+{
+	exit(0);
+}
+
+BEGIN,
+ERROR {
+	exit(1);
+}
diff --git a/test/unittest/variables/inline/tst.sched-cpu.d b/test/unittest/variables/inline/tst.sched-cpu.d
new file mode 100644
index 000000000..542cad7a1
--- /dev/null
+++ b/test/unittest/variables/inline/tst.sched-cpu.d
@@ -0,0 +1,28 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The 'cpu' inline variable returns the correct value.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(cpu);
+}
+
+BEGIN
+/cpu == curcpu->cpu_id/
+{
+	exit(0);
+}
+
+BEGIN,
+ERROR {
+	exit(1);
+}
diff --git a/test/unittest/variables/inline/tst.sched-lgrp.d b/test/unittest/variables/inline/tst.sched-lgrp.d
new file mode 100644
index 000000000..0ddf20180
--- /dev/null
+++ b/test/unittest/variables/inline/tst.sched-lgrp.d
@@ -0,0 +1,28 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The 'lgrp' inline variable returns the correct value.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(lgrp);
+}
+
+BEGIN
+/lgrp == curcpu->cpu_lgrp/
+{
+	exit(0);
+}
+
+BEGIN,
+ERROR {
+	exit(1);
+}
diff --git a/test/unittest/variables/inline/tst.sched-pset.d b/test/unittest/variables/inline/tst.sched-pset.d
new file mode 100644
index 000000000..a7c946bce
--- /dev/null
+++ b/test/unittest/variables/inline/tst.sched-pset.d
@@ -0,0 +1,28 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The 'pset' inline variable returns the correct value.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(pset);
+}
+
+BEGIN
+/pset == curcpu->cpu_pset/
+{
+	exit(0);
+}
+
+BEGIN,
+ERROR {
+	exit(1);
+}
-- 
2.45.2

