Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F7117C96
	for <dtrace@lists.linux.dev>; Wed, 27 Nov 2024 16:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732726317; cv=fail; b=nQDySbE3pW6xQPM2gOPVk+Cm+U5U1rSc/YtEVBURsZk+YEfa3AQbBqeBWX7hPmbBiJoMqxHj90QM8bcvH4Ro3+thc2U1rBf1VjOOMyeqA/f8nPZYSXu6funEnJsofZVTbvg13MpsKNmfVzsuaF0XuV4UILNUUez6ckT6WxNISw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732726317; c=relaxed/simple;
	bh=c/U103lyfLZPdy8NXtbqYhhyXQdWWkV8QJ39QGi/sWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yphc5uktPr2uEtd5ws0+n1YRphMA5zPlhYHwp3r8I/gHHGP5GZIg/FSXALeotjNTEFCkiDJM5hfhbi5gvWPIn7nvUqQdUNrHecWc7ETNo57qkDrMDL27kchbzsNcZrlgmHTp2c95t1/2K/NBI9YBurCHVEQVc3Y0zk/YiyUyi4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c/j65QM+; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ALCYAngW reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c/j65QM+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ALCYAngW"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGXUVM031615
	for <dtrace@lists.linux.dev>; Wed, 27 Nov 2024 16:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=WPMTGyOKyMC+CvcJmY7E6TOPcrjZvF9PMUmCaxMPqEw=; b=
	c/j65QM+QTWngnLBVeEr18nrsuu53UlrR46wBCGW3oNr+LB81A9tGrKVOcFvxo6A
	yMDWQWFKA5m3e/o35R9D5vdqVnK7ZqxLpXizzbrNK99onniw8vEJ1s6iBm7qqRWD
	p9ZSOofUIi9AxrDjsJsE89TiypWT89ghaEM87tslo0Ujun3MYE9Y4R2VcH0FUOpX
	HRmabbQzfNTYNDXJyYIgahgazKnrMF7+YCE/XuYuyD7HzVdeUsgMbWIi2a8wpgWS
	6jdqc1iS9mI/LxgpkPReeCMwJFvd/efLwQBi597VkmreOFzRhHSpMJi01Bx8Zi5d
	Tpk46LBdoCvmYMwzTectsQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4366xw821j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 Nov 2024 16:51:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGTCFJ029277
	for <dtrace@lists.linux.dev>; Wed, 27 Nov 2024 16:51:53 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 436704gv59-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 Nov 2024 16:51:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWdACm9qbLbSd1nDWwwH4CLvwT1kVu60vzpKU1XKJjUMGeyrqkf5tffUbUzv8G9ewZdel5ZP61Fo7Es78N1jTdeYdXQQ6hzMWB2yWDGk0TdrtSThe8BaBT7Y0UNbNlEI4b6mZAG1XPyiC+TKjsuTOl0GhFC4C3EGgsNKtWJcpAWpUGff1AQbwTiLNO0pG/GTRWphUuozaQKVRRmZu/8kxAjxSkV5fHlaNYwE0aIAlKH4fL38nbXrm2ll/Vx6zCVEH6opvYRSOkrWYMszRMMfkUf5ZtAYwqvsd3lEAtKRuPYDGF0cHBg2WFQCkNeQRSqM93Lx9XHNnV2l1U78mxEmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGicRcRk3sBPBoMoiBTPszfQUVeW+5og3mycaIKeP7U=;
 b=kzaCPE5IFUlOrE7XO6NeeSQY9Dob/ff/Td0DA36OkVSYFBIIkoj6MDiGeOM14DTQw7PtRPXDQfz3xfFC1x3FKl5K7Zgp5yu/5BmFefwPixOcEILk6VdA3kXwLnFzXOCPhcJjP1Zi8M1z84B7SKKm9/trbvqYgODrVYgvnNpcf+NgBkXNa24aV3mjPAWxHdD+mLYT4wU0owWNF9c06GjaHwo2kmkk9Jc0Fb6L0il1AWus5HmF1DLa/hsr42bT1np5JfX/SW7L5kDta6v9WQizrjiMtomgItw48oxiMaViOKlBz8x6hx7M0EdwvJKHpOu7znlhi4sfb3LfSE/FiJV2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGicRcRk3sBPBoMoiBTPszfQUVeW+5og3mycaIKeP7U=;
 b=ALCYAngWuhMgrfoI3xzk1HTnnzu47O46PWnb2Ci3aDLP9n2im50Af15fUJZI1wtwzRhWoQM9rzLnga4A9Vdh8eHk+eU4frs1jsJPUQ4UZqzaTEUWpQGlLZtWzbUe1hZ1cYXbErRhfC0nLBB60Xa9SsQ7B3lGNIJK19MdWyecDFA=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by CH3PR10MB7959.namprd10.prod.outlook.com (2603:10b6:610:1c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 16:51:50 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 16:51:50 +0000
Date: Wed, 27 Nov 2024 11:51:47 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>, Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/4] test: Do not depend on ext4
Message-ID: <Z0dOI9eQui1v5wDR@oracle.com>
References: <20241004044355.25870-1-eugene.loh@oracle.com>
 <20241004044355.25870-4-eugene.loh@oracle.com>
 <ZxwKuCIs1atplKFL@kvh-deb-bpf.us.oracle.com>
 <9c8bfb58-6d34-07d8-243b-691fc62df38f@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c8bfb58-6d34-07d8-243b-691fc62df38f@oracle.com>
X-ClientProxiedBy: BL1PR13CA0436.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::21) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|CH3PR10MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: fb736125-5225-4fc8-a9c5-08dd0f03ca01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?gv4oIKEidIQfBecB9wO++LcKGn4Y0/isS9+OAg+7h1kNW4NvCSICj3hrkH?=
 =?iso-8859-1?Q?437705PEMf33oJOQw7ZehivneFWmYnmMD8IKLd2xUHdPKw3fUwQyIXbjJw?=
 =?iso-8859-1?Q?we+URW+zDf5MDfXUaAK8hGCNZD4E75H+yRbHn5Roa5Kr/gzfBM1m82MKDG?=
 =?iso-8859-1?Q?9z9srAjBp0GC3e+cZT92VDNhjipsyJHhGfvO7Gg/2Hf3rQt6r3pkKSg9MB?=
 =?iso-8859-1?Q?y5u8YMEQ7M2G/EY8nCuRGTNSOfeur/AfGZq801mkFXwb4U89obfMW1lQbS?=
 =?iso-8859-1?Q?VvE57o9zTOpcKC8/M7s1wnigymKjjbNmAlA2DmhrIhyeQtiRifJbbFHGuc?=
 =?iso-8859-1?Q?KPMZ+Tmd3NfhMNy6AYn7QZ43D+mQDn+myKbRReKwuod7KL62YYhI1w5iYX?=
 =?iso-8859-1?Q?PZFNA0RUN0QntRj/J92tJFGZ4KWRFmtDMnOnHv1q9WLvrsyEQSE9/qAyx/?=
 =?iso-8859-1?Q?9Dtf7K3pJ7Q8ruHUXWrx1Hrvteu6g5DUZoRVkZBPWmm5RJsyWAnYWzTeLR?=
 =?iso-8859-1?Q?r0n1NQzzLY6sn2L9hPwQAF+3Z6IVkvilC/GHbRJM+aUHXo9xPWVF/Y4Mr3?=
 =?iso-8859-1?Q?4MdSqPZfFHbzXzfp8Wm8DagWi6UocbtFegqge57O8cixIDOWdO2dOZiNer?=
 =?iso-8859-1?Q?ix9FPhrTYIkyGAS0n0OI5o37fT/Yu9WjVk2HUYzeasChbNK17oyHcE6Df1?=
 =?iso-8859-1?Q?HmAUmBygVw/OCSJy68Ahlpi6iOCqqD0UtTthGCP3MBjwJIenD+KP/FdZ/B?=
 =?iso-8859-1?Q?5ukXUaZild2//9J4E85It/bozIUH8rRBX0xAuC0HQA180wFtt5W9iy0Zgp?=
 =?iso-8859-1?Q?Ku3bLXiWtn9wUPIy7CF2bXFq3RnVYfIBa2BxcGa8q4vRDl3ksHcUSNbOuG?=
 =?iso-8859-1?Q?Bfi9Av2nT9V16QiF6PxYtgCLBp3B3NZXBtYDZxmmuWle0ZMCE9pU1Vtf7e?=
 =?iso-8859-1?Q?zAb/is2C7Qz9vlWY360lERGwI1O5J534yWWF/a46DTFUj9nDNhVaues4Y+?=
 =?iso-8859-1?Q?xuvtHc6aKjJt6v+xA8dI+zZtXUH7T/E1l9D5J9SMI9/iWPTa4giFOfSHxh?=
 =?iso-8859-1?Q?XBzfTOWvgvpw29XQVGeeaFDIHXeG8nLMmHfaavQGXRWxfjyJPzDKssDx5B?=
 =?iso-8859-1?Q?iRLhPR22UHHZ+kk2r5+2UvU1iz92obo/ze9Jw25pZwX+UVTo4BW8MqA87Q?=
 =?iso-8859-1?Q?DR6XGcokq8/AYxQ9J7LvyI4mEJLF+ejcqeMOazhyAKcx/9xF1CPv9vJ2E8?=
 =?iso-8859-1?Q?g9dPcY3TVEtvedHdOzX9zeQDkF+6c6Ne6BGdXO25qInvkxgWK3DkGIiD78?=
 =?iso-8859-1?Q?PxZwWoJhO8WBjOcRmkyrZzNQwIWIz8h4fy9FanGd53NH4ObNc+NXor8KyL?=
 =?iso-8859-1?Q?rJbYunQpy0ekQURRDRE6/dsrG62XsEOg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?sfrOo0iSMCJ8V909XqdRtQNsXGdA/87MPF+O5KNroYCfAHDhaWm45MiDuw?=
 =?iso-8859-1?Q?p8uW+9w/aqOWRUVQgstmWUUbpVr/Q1l6Nt/rNb57onp3ahFLndBXAsVFXT?=
 =?iso-8859-1?Q?zQzc1zGwEO80qK73LiDWCkK6e1JseOd02sKQDzb+SV0ZBF8Pv2EjF9Ls6m?=
 =?iso-8859-1?Q?fNkZYRVQfHXEgxOeUFPeOa2j9SMzAd9h/Udq6oRg4OMMo41JCSo60aI1YV?=
 =?iso-8859-1?Q?nKtoDVWJs3of9y76jLKBfXw11H5lO79X1St8/QCfx0/M3vNvoPeNIPDxob?=
 =?iso-8859-1?Q?5RxNvoy8SiAufTxtYVFWoRq8QwWCQ8Br2MY+rQNhwxSQ8NtEYtrta9kRHT?=
 =?iso-8859-1?Q?wdg1cLc8WVxnO1ggD33ifM/0SFt/8YQkWB8qfe1audh4CzvolAgBh5fGg0?=
 =?iso-8859-1?Q?uKsYQ0GVCssQfBS+g9YMG0rngDs2101Zd05KA1VYfZ02rFCFjWz3YRS7Fj?=
 =?iso-8859-1?Q?7Dnqnja7ZY5H77dXjWGQoBjn3YqGDqO/mmgXfV7yZNoboua8Lw3DdY38d6?=
 =?iso-8859-1?Q?amsZ8A3GkttkABCRm2cEZ9JRaXUN6u/Ax3/ZGq796NL3OlcHysHDIFAAY2?=
 =?iso-8859-1?Q?tZxehAiVxUWDTN0o3T5Z6skz7+Sh52JR/Rq87CIK09c4fy/iyk9U/Fm/H6?=
 =?iso-8859-1?Q?QAUMSOw4tWyyiYY4e+iAjDNVhP6UQK5G71ya9GMiao48F5SKJ22ackuy9K?=
 =?iso-8859-1?Q?6alB/fSZTGh5n/EQ9Pk1QB2P5Mw66WWirCM4liHOibG7mITqnctzzArZdY?=
 =?iso-8859-1?Q?0tx0nhAc2magsXDylgcyPE2o7BFNeUNahYdo4ujIfK1WOinwhLYpdLTk2i?=
 =?iso-8859-1?Q?lFAYMIEH8iOULuy5blFk9Du8iQLQhLAYSpFWPx8w+OqHhULWYkQxOyfnh6?=
 =?iso-8859-1?Q?dYWUMHrKSq35PL9tbLW29DuDwUrZVd29ttNV4QQfUjN7uifXFPUAm1cOhi?=
 =?iso-8859-1?Q?V6h7ZsbJwKmfyGlLRPVj4x7KDbheA+F+NTxC90idBE9Wl1HftlE+z20jG0?=
 =?iso-8859-1?Q?/MuiKI3P8YG4y8kZmMAEdQhtPEz2Xyg1JIqiiX44IF7s+NSaz89u5Kx1Ye?=
 =?iso-8859-1?Q?JEy25KolhN6iaFy8NL+8KBbVavn6zrPlMBXCQWbJB6lact059IjjCMrOKz?=
 =?iso-8859-1?Q?2K/01BFkBn6aynh8VJDHfscLm8EepLHQRKrLCMCgoS2i/Xce0RVzrahADr?=
 =?iso-8859-1?Q?i7Zfz/aSxhhdRc/19MVD6BW2kPRqP8mWg/udjnWlWAxpubYsbT8m1H6zvN?=
 =?iso-8859-1?Q?8dsnn7EZOeajXK+eMvnok3NKO31X1B+uCMR21dJ0PKisf/KoxMeFF0sIDd?=
 =?iso-8859-1?Q?K9mZw1Fnrp9nzU7NK7eh81ZzoLHWLka6AfY9pPKGPza9zCN4Hzko/60PuD?=
 =?iso-8859-1?Q?SmkG4o9Ki/B2K9g2Ziyx5AAa6yn4QXdFH8RatMPNKgTxAOxduAnVRyjbbK?=
 =?iso-8859-1?Q?VWCEFzb7wjfhKbSYO4ch/h8NSPEVHUKMIeymAvsn61iVVRbJj1PsZSFVQ7?=
 =?iso-8859-1?Q?Q/yBTg1dWfqDkwp4ghVqB46IvYgTrhG8XfQOyQ2NtARakLeEE0DFw/xujf?=
 =?iso-8859-1?Q?yDpy08a0evZPv8iq7Cx06qNXMEZ7Wz10d28FRV2tJq1Bfiue3dopa+zzK1?=
 =?iso-8859-1?Q?8c4QiOuWJRrltmkL3hYV6zuZkOnFENRoCCM2vK9aaBt/1NCCaYCdlrKA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xTUmqPXkXhk32UXXIAVtPBFG54k9GZTRIhSFFVfuhMCpN1PouCmByA4Ai5l4iluiB3OH46sPDZAoAiSFJjVQzjE79hbiYuJ8aNHhhiit/vjlXZsWx6bBf7VnRf/Pnbby2xjOdnMaOuuMvawUIRuc7WJB4MVOxVdaA2R99nW4IyQ8Cell46dv5WuQKDpk4720m9I4zGf6AMbZhX0yH4tlzG5pIb4IGdvkx0PafAA4cY6vw3/p2tjR4VNBXFyGIJKlcaaX22JegPOONL6AkYnPSoYC4a2c3orHNt4vmYNphbNVlUqg+uSCGQKaCHp34W5TxxMpmtQdEAIWCrFwu5+1Rb1hyChhi3uYyuL/WVDHR4yG5+Ze2eqMG3v3i6aq847P3U2gQSeKEVWMTcTRhMhvXfyGhfLlz5khevThhsTVr2zpSVytaV7WJhVYPE6rcomJNENcEOG69sc4m4pZM7asfaJU/PgZtgWHlBqugcfCOzctCxJzGtRuORQlDRog1XVGqRQK8cW40IYs47C4t5L0I+eAn/xG8R66FqibLiN1H5nFrXMpBnYMhk1N73a3j6+0qQ3P8Xu2v9eqoicDJscHBfCpPpl8eVrqBAbgtvNzi9s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb736125-5225-4fc8-a9c5-08dd0f03ca01
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 16:51:50.6769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKyhMSbCNU9Ojwm9bKwCrUqR6YElvuau13dvHvaRt58n8H3o795IhCr7TE0/NMeyS2qZAwItuORI8OKD6/npEPgcrqC5kZC+lrZn7kdIpS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_07,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2411270132
X-Proofpoint-GUID: zzbqrqOfiF-uJmhAZaur49BtevQpeTrB
X-Proofpoint-ORIG-GUID: zzbqrqOfiF-uJmhAZaur49BtevQpeTrB

Resend to the list for Nick

On Wed, Oct 30, 2024 at 04:14:54PM -0400, Eugene Loh wrote:
> E.g.,
>     $ uname -r
>     5.15.0-205.149.5.1.el9uek.aarch64
>     $ sudo grep ext4_dir_operations /proc/kallmodsyms
>      ffffc45a59d9ee88 100 D ext4_dir_operations
>      $ sudo awk '/ext4/ { print NF }' /proc/kallmodsyms | uniq -c
>        2342 4
>     $ sudo grep -w ext4 /proc/kallmodsyms
> 
> So, lots of ext4 symbols (including ext4_dir_operations) but none of them
> are [ext4].  Bug in... kallmodsyms?
> 
> On 10/25/24 17:16, Kris Van Hees wrote:
> > I am not too sure about this patch...  We are not using kallmodsyms anymore
> > for newer kernels, and on older kernels that symbol certainly be listed as
> > [ext4].  So, if ext4_dir_operations *is* in the ext4 module code (compiled in
> > or loadable), then the proper ref to it would be ext4`ext4_dir_operations.
> > So the test should be able to use that - if not, that seems like a bug rather
> > than something to change in the test?
> > 
> > On Fri, Oct 04, 2024 at 12:43:55AM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > It is possible that there is no ext4 module, whether built-in or otherwise,
> > > even if its symbols are present.  E.g.,
> > >      # grep ext4_dir_operations /proc/kallmodsyms
> > >      ffffc45a59d9ee88 100 D ext4_dir_operations
> > >      # grep -w ext4 /proc/kallmodsyms
> > >      #
> > > 
> > > Meanwhile, in
> > >      ab883bae "tests, io, scalars: use kallsyms instead of kallmodsyms where possible"
> > > we read:
> > >      scalars/tst.misc.x needs adjusting to check for the presence of the actual
> > >      symbols we are looking up, since the modules might well be built-in, and
> > >      thus not show up in /proc/kallsyms.
> > > 
> > > With that patch, in test/unittest/scalars/tst.misc.x, we check:
> > >     -if ! $(grep -qw ext4 /proc/kallmodsyms); then
> > >     +if ! grep -qw ext4_dir_operations /proc/kallsyms; then
> > >          exit 1
> > >      fi
> > > 
> > > So it is possible for us to find
> > >          `ext4_dir_operations
> > > but not
> > >      ext4`ext4_dir_operations
> > > 
> > > Change the .d script to look simply for `ext4_dir_operations.
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   test/unittest/scalars/tst.misc.d | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/test/unittest/scalars/tst.misc.d b/test/unittest/scalars/tst.misc.d
> > > index 60edab45e..6a5f4ae2e 100644
> > > --- a/test/unittest/scalars/tst.misc.d
> > > +++ b/test/unittest/scalars/tst.misc.d
> > > @@ -20,7 +20,7 @@
> > >   BEGIN
> > >   {
> > >   	printf("\nr_cpu_ids = 0x%x\n", `nr_cpu_ids);
> > > -	printf("ext4`ext4_dir_operations = %p\n", &ext4`ext4_dir_operations);
> > > +	printf("ext4`ext4_dir_operations = %p\n", &`ext4_dir_operations);
> > >   	printf("isofs`isofs_dir_operations = %p\n", &isofs`isofs_dir_operations);
> > >   	printf("vmlinux`major_names = %p\n", &vmlinux`major_names);
> > >   	x = 123;
> > > -- 
> > > 2.43.5
> > > 
