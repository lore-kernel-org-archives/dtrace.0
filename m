Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4C25634
	for <dtrace@lists.linux.dev>; Fri,  1 Nov 2024 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476663; cv=fail; b=ZnyGYAKypmWkfWWXnCVv7MHi74A3mz3bAHT4x7aDTk+GlML+tjmf4Sr1w2V+94r/IrH/P5oCqAd6QhHaGG0L/tn89YcrltSgdgs0l59x940o/dzfCmfde3IGx0tlyL5NK+R2Yjhy+EDAYu6HN8i8o9mQkv6e8EBfLK57LgKkUOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476663; c=relaxed/simple;
	bh=7Q3vBIZ80umpvAHXtcAyDurA59mn5M1au4DBO+/c8xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lJk/tBzBlW1Ji5G73re7fzOsLJT611j8RD+DHSUdFxlcLlwejZMQU0aR3jKvfmkVxG2Vsmya62bvnKorPRGzEL00VA7bPHHYS1D8hj1jivGPEjljwh/+pRr/J7BXnGT8uJylFfxOKYqSxeSZvxsgKkbDaPUYQcRGdNinXtgp4xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZoK1s9S/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D2sz4r3i; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZoK1s9S/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D2sz4r3i"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1EtWs6028172
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=JYqCqxhK4TML3goykiXIwHjraFutM38w+IE+0JWik4Y=; b=
	ZoK1s9S/ZddHJt1pIZXqB2PvO9e3HBe/VUseqtzB4yIZ0skuVomliErLHwB50Urm
	BpUKhE60pQTEm3EuaCwwxRCvQOBItpt73AcSJOZQ6FDkDev7oJcuLV2CiM2ARm1H
	3+L5F2t5oHbzCwOZgrKHj9rz0df0iO+3jNxT8OHY4lOusW+U+jXn1hNrnW4qeCD1
	KjkftB6YagOPIc3tuG13va0MpB9yrdGPfMDS4Dyd7xQSBryJi5K0VwyR16Bio8b1
	xmBf5/4o5kM4llxZ89R+QDocub8jSxWjBVE4uB73N60Xhh8UdRPd18acrt+Tc/TK
	mL9nQkAL2/Gj9/Jpx27flg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdpcj0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1FO2TS004798
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:38 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2y7m4n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/JuEIrn+YvrgGP0ojSw2yIX4cmNwfr0rjY0TRbpA85kziyxIjkeTFNEtZCB5DBDDCe3shRduEDHR+EiYri+POe7a9Xmw08pzJgZVbYlZrDcMxCN8pJyQZVuSi3djifhezI9+8qa24OVRYvwl6Uy0w6mnldsV9wEHxZeZcD0mrZhpLeAhljrBQzJYYktg+vXM7VaZZaV2wId26OswfjPt4/3BSaZNdySyBCApHJnDxumAnbJMIrKiFeafC+z+HH6V5jmJ6WeoYgctrAX5QGKlD+bFfX/IF/ypomRjaAv+acwPXfcV5N/nXgXEE6nJeh9GmrcyPiI07Od5RJ2ZmD/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYqCqxhK4TML3goykiXIwHjraFutM38w+IE+0JWik4Y=;
 b=i9Dq5Vw4Q29VYEke9Ebia38jgznVsQEBFxxlyAlcFHyyli8Vl6CHzhOTgUXrMKSVA8qXqhSvfP4C75pDYPkgZoRvMclHAEpKRm0TDywAS5J8m6Hm04nPsLj1xx6slC4rIdIiB9MfKhF5OFQYsNyYyej+rh5tJSR0GEy3H53KAJFIJ6tvjKYcnoWWHOjCQz5Bb1HQtvsonn0fDTy6NgmYpaZtrY39+GqkrLdnS/m8MQy72irPUrcltn0ROyNJp3RyaNA7ONeZ0qiWNPyOPE4aNoId+S7R0SrbHfbNtjT+6Hr0ycI7rAGz6/qTg2aUuHvp90rYfFLo24HxeMci/5YlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYqCqxhK4TML3goykiXIwHjraFutM38w+IE+0JWik4Y=;
 b=D2sz4r3ifNbPYpzHBo752smRPOCli14dviOhisRG7E23QHEAQb7hBRjEnfJlZXpL81QXdb8JrXfroeTGRwCc+RuHAsEK3PyrFIvuqBSiYI09n1tZSRZh1LYrdibyu7TVA7yhFB7ZQTQk3AOIVzZw5jLPjChgqw0bOuiPXzBJfc4=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Fri, 1 Nov
 2024 15:57:34 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 15:57:34 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v4 5/5] usdt: fix create_underlying error path
Date: Fri,  1 Nov 2024 15:57:12 +0000
Message-ID: <20241101155712.397674-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241101155712.397674-1-nick.alcock@oracle.com>
References: <20241101155712.397674-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0100.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::16) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a878ab-7d2a-463f-4449-08dcfa8de695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?saE/T1CgciFnK1O6DvP1gXeh7rAWX/qRpvaAGR854R0OOhVIeL5otkD4i9bL?=
 =?us-ascii?Q?Ktvau4QXlEDXrpgNyGOwmPI+RxcsXZG6nWUzs4xEAI/U4tWObrN8mzdXAcBO?=
 =?us-ascii?Q?Wm6/7eCKSp6vO+f7iQwoQxlDihY90K3CmFfnmvj/e2H4q1AKu6Neg3dCX/Fk?=
 =?us-ascii?Q?dKJ0qFeNQvs6WwTZWozBdr8zJX9SPrBzJvdUWxyer6w1RMKwSgP22J/m3Wz3?=
 =?us-ascii?Q?PiK+QwIEk0OntqD/Gu0hlamp81hZCOR2LDP7xgFW8622Bb8X3qfFKeutmAvo?=
 =?us-ascii?Q?uzPXcz2KHhq2KBFLvH96jDusZBquL8guTKqZ/SgaHh6ljA+Iu7X9wOP/+bsZ?=
 =?us-ascii?Q?4DTRGtDNpPmbxIHkR746o6WhT2Z37vQqutxg7kjjOwHsgQqXfrfbMeR8ziTP?=
 =?us-ascii?Q?wZgyf7/cmImX6hq/7decqFuZKSfM4ZvpQmUIrUtDgey5obYT+kpUx3gWOfEJ?=
 =?us-ascii?Q?NwEBAQpXkq9JGViuLIRc7Vv9j/XNsBgmKfS3b174+MUcnmyDsV7+uBZLtKIj?=
 =?us-ascii?Q?Qte7/WZAyScYfeqxuwttTq7L5ezyOw4enkYrq2oafsxY3QYU7quWxwgBv6hg?=
 =?us-ascii?Q?uxkqgXhfIP83QnPhEuVQhjkwvZEjYGqPlTjMsxUxaUBCjNwirAqLvCXGUQjp?=
 =?us-ascii?Q?E/gPM88J+C6llNl1Xwpsz1PaDrncM4jqAFkvCyRogJjKBH0iAbyglkz//XRd?=
 =?us-ascii?Q?UPCQKJMyMJZqqjngv5xp6E+aUJa3p6D9MblShAYo/dDRp5HxIAqdE3smj4WA?=
 =?us-ascii?Q?cm67Tzir278e6t+w9+m+mbpfh8mMopOwntTKB+P8keHmFHQEsWyIa6MZ8db5?=
 =?us-ascii?Q?vcig2wwEm7Eb805sI/EeLouLjD+zOI7pBzqWQaXrFunpXdWvRRIh+sa7b92l?=
 =?us-ascii?Q?YTMydVmiCbAcC37MprWpJwNmeQXKu0CTBq6ILb9dY440U8kxuaiGgbTHC/Xe?=
 =?us-ascii?Q?ARSgCiEyWk3Yu8Bwy0avJ8ZaWawsdS6Lxt8uM++iNA64Pd46ja/0aAlDYgUG?=
 =?us-ascii?Q?4SdHo2AusjAKYh4aep+/Z+9nr/wIGagDzjnP13QOujLfieh/JtCi91FZjU0Q?=
 =?us-ascii?Q?YDC9wGu7qss5ivtsT4V5Jfyfaj2a2s0SfsMvmXnDcO5GLwNY+sIMbQpsNIB1?=
 =?us-ascii?Q?O1c7hkp+dIyNsw5Zy06CMHxX0yb5DZzqQHHky1TvcomX17A1/2L/xAAuSQEY?=
 =?us-ascii?Q?iwX9XW1MS1uNdOnPguYI5G+Tp+KMQLjtQ9sSeL9rzXVQeiTpxFDmhA5Db85z?=
 =?us-ascii?Q?miOCIepBWnYDAg2qAd+WFrmF2EMDvfHwSSJ9SKihoDh7piLFy+M5USFaCI0W?=
 =?us-ascii?Q?e3N83aLBVEqjRsurcbVat5Wt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eLccgxhO3PrA6pnVQNM2GXpXrRK8zv1TnSYLR3/H8CwORw4UCMLu26W6RWOD?=
 =?us-ascii?Q?MXTV4m39qIRTs+idEU6vQ/K2wFCVPP7rqmWRnSBRBioI2BucTAmqgyDhKPh7?=
 =?us-ascii?Q?/ZbCkYY6fkYbq0u+kI1R7S3ZNd06HACIGAocgaGI8bJ1WwbebEssRs+VAbK2?=
 =?us-ascii?Q?qgvBT49BFGXLacqXugagiyQ9GNH4gWtrqTvzRQKvmWEy9I9FfY+GwYTPO6ee?=
 =?us-ascii?Q?yV9oSBYbznj8oWu72SmH+AXnN+n9KS7Nfw8jmb24E/2oMwniYGf9AMy0pQgO?=
 =?us-ascii?Q?f90KvYh74UBlqWa8A8a2/T2GZhXbBBJalFmeVwGi5SWHTMSeCG98LJQciNKt?=
 =?us-ascii?Q?nltC9bGqnl8MdJSouB0Uxz4T80P8f/0mZeA046XfI2R+uvNEBjtIdTN8EoHE?=
 =?us-ascii?Q?47SFEmam3/dlZokGJVW4qk0Fdctvtb/EXsbxCIGuM5sFpvwreH9G6XPU+izy?=
 =?us-ascii?Q?mMu1avnh1/2fhldb+4I9lDMYfGUQ+5ibhAQkBu1rwSFqvXQASKCm3i1oM//F?=
 =?us-ascii?Q?UIYZxH8ZqObwV+Fv5qP0eMjSScdjPfBOFd0u9JWQa+hQWTyFrdK3MINAM8Je?=
 =?us-ascii?Q?/WavQuHbh03sLUc7PmCdYsu9gRCRTvLWUurekvzWX3ZwxE2k1LNVFpRYnI37?=
 =?us-ascii?Q?PMxNKXmt6hlhqICK+dAOrN5bKll5K8vJZ2L8t3Ap3u4Q6nIA+f8IIT/yhUlt?=
 =?us-ascii?Q?MO3toM54UEs6EiBGHTDEf4aktGExJ5HaLhGHZ0/9oJG1dbYjYT8ha62XcnLO?=
 =?us-ascii?Q?RIF5WDonUOGXdjVr0Txo0Je34OkQsloxbUUm5lP5lBN9MHaJcuZZhgQZMXJz?=
 =?us-ascii?Q?Pkg2DT8IYHp7aObv1X6E14li6isesFPLs+CZHryT/0OxUhztfQAPjo/BiiSo?=
 =?us-ascii?Q?GFz1xiMDPioH52hoRvN3krnPFoTZkps0IqY+N1oeM+ORmnAgDcBxPNhPmp5R?=
 =?us-ascii?Q?4AVlLCCSoIGMlWtuicU71YuEx0eNVtFJ4QA2I75kugntcvwZcwVB8oLIXQmH?=
 =?us-ascii?Q?X1b0TqA3N7Ww2Jvl/cvpWa2OmtAuTpD4KRjX/ufEvDnfgOBkBAZFHsjMijEn?=
 =?us-ascii?Q?VMTJawhmDVkqbo+P31umsF8JpoQZBfaewGjRttSsLAZGe2wWtrOtkPKtumn/?=
 =?us-ascii?Q?f7x/Fi7lGxdwTk6ggNo+PiNWaoG1aitFwCle31EKp4iZl5GjouHi/K1Qz+1P?=
 =?us-ascii?Q?DilzZl829k1ZyzEuDsJjgAxNIWO4jAwFSIMvHxwYuXyjLZ2xmi6322Cz6Bd9?=
 =?us-ascii?Q?V2UX2AAohunymfJOdamgvcHGnlUQEAo8xMt8pUZir4uV3MgGbCgFYCRktfQW?=
 =?us-ascii?Q?sAQy7jiSlcbA7Mb7WoFcHImF7NtdMXKlyrJeznq5ekgoixIzA20W37YbhA3Y?=
 =?us-ascii?Q?qtC0RTjuZ3yWj9gEfGwm81RbSvrWOF5pDnKItnkOtU1igTjhc797Yj5dfnWG?=
 =?us-ascii?Q?LzArJGQiDmKb0AXo3ptdp8r1LBnLDdslrWIQXqWGolZJCe1tWKst2PfhpSAq?=
 =?us-ascii?Q?yH1VKIQDPkWJItc5r+/ScZJJyIy8UIEwrJ1RPFQVm06crlAiDknHiO4+ut0Z?=
 =?us-ascii?Q?yys0iL8hXvYmiDGgdfBeJkv9xqQc26V5h8nzY0v+u6zZpAwLUlTcJY1QCUFH?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M5nveyEO1fuf+W8yUuLI4HwieO5C6kcBFznySjmbwPfUz5a6PT5rER0SNXj5NM4oP2pdeKKl8K5acbsfj7gm+6HU7NkaeZb2D0JuSNDjKHnEuQhBpZblUWp9htXz9kksnltA2ZXIMZzvLye3txW/hW6ve481dzOIV2hPcFBVoiVGuma+Gv4om37zp3avM93jVZ1/ZeTOdEOOWaiKqNrmhI82r9x50fCtz28T+vEEzeVX9Jp45PDLVVVwvGPMryxaA5jTZZI1l75xWGMWjlprK+0BOF8En+g+xbUlBUXeExBMnQYCvw93wyS8CtkHw2X+kSiRwSQU97RKznbPe953RaG41OvZJEqgp2M+v6JcvR5EVNThz3FgTiBgFXiTlJ3OQRqYNOotWmpYCCq6mvyKyxb8utDrY4Xecp0aZqCp3ggHCq+Wj6jl1iirwAhHN4oyQ/2Xj/59NPSYC4u5tQteMotNqNw0cwXgD8KdA5GShGQFwkXQU5hnrzmhyeOJEOyl/i1nyhHwQORMhK06YfgogCFpklGogCQI4gkirib8pAgGHCR8jX3Ic1ef9QTXmTL44qNd+S9nmE2l0GlhK41b3XJwsTq5MyjEbrwm9L6/Mp0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a878ab-7d2a-463f-4449-08dcfa8de695
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 15:57:34.6778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppK3vdy66U+okP2bk2k9dXfN2ToOHijEYjvPTR6FWgOquFxvLtN9POcga4ngLM9t3JyiQvUAMg0KuW0YzW+ukQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_10,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010115
X-Proofpoint-ORIG-GUID: n5vaBo8N46SlH9KsRB9OjXopUZ_WKSDb
X-Proofpoint-GUID: n5vaBo8N46SlH9KsRB9OjXopUZ_WKSDb

On error, we were destroying the underlying probe using the wrong call,
as if it were an overlying probe.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index fd7ad1643946..6132871a9007 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -706,7 +706,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 fail:
 	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
 		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
-	probe_destroy(dtp, upp);
+	probe_destroy_underlying(dtp, upp);
 	return NULL;
 }
 
-- 
2.46.0.278.g36e3a12567

