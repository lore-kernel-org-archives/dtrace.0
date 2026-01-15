Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9B23168E6
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768515801; cv=fail; b=Zr+Z14O/io3Me1zlU6L3gVLY5HpJTPtVlgmkE5ijFUYJ9M4zOrYAm7XC9KMNtAwxnD/E7UWO4oJHt/ju1YD9Sf64vYPZc9Vbai3LqX0+xO0B6dqx1grtMCI6LIDHopaoIsuGAvkUX9huPN3w5icgXfgLSvyz+2NwmlBe0+1siWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768515801; c=relaxed/simple;
	bh=7G+4VrdpfLOG7+Q1ffrGkbdP/L8uOw5eyHzHaw6vtpo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=O7itbRh8dvRXDjMt+IvpJlnu8QQFYERkqZMccJzAHDDUJrW9Hwtx+0081msPpzIQDAijC0/dOZ5xJFD6spJn2oJeGzcHfYWR+UMsYHGLyuy6Ywt628ENQbqdpd+A5bErGV6CfBH/QxxxeoTyV/WKqVWBMWUqWEw+AR24RGfBGxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pwM2TJHs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OgHR69O5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pwM2TJHs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OgHR69O5"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FM11iq2418953
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=YYeERTmq96yPMYUqdE10KidCkH/2TbWLlIdpW85nUbw=; b=
	pwM2TJHsXLh13vop8VZjLp/g8cHIEG87NiL8xTclOtBs/ygzuyAwmNkPNRRN8L57
	/3kXpPMiSs/BHeyq+DmHEaOB4brBMGc3v8BmdyXqiw97tmYWt6c2ARbey4G6uOYI
	U4KSZZjfqEUY42oATuzwxZIuPBe6t3ac5qcIwiMn2aveFAKme6cU3idUAQlKQHSR
	T0G8ri55mtVkOqSB5v0zxxqP1AfHcHwCNbdJniDJYwgVdxaSx9fi4IrKDtnnRrI+
	dpMxckMSIwtMLDCK27+7AqDkRQKHA+FZBVd5jAa+QKNpML3KEf/GKyQv0jeAB4pO
	qs43ZVJOOn1RA0LfMPgnDA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkre40wvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:23:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FLxDYH004585
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:23:18 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7bwdjg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:23:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuThXJL3iE/bBCsx85ygGsTDe35wyJMwKs2FMbGTTkm/x4qN5GDd1mMgxhQQacbd2FsIjFG/5OQ5o4wc8Wg5YOL6swDz+rKwBIWggr/z2aJqgoJnpBu483y9o2+lmr2+djWbiMH8Z4W+QEDDOdt6PCZKn58FXjmDEyLWN0eTKC+C05qT7+QvXxjRsxyMbnjUeTzqbpgC/TZz3F+ntuucmvmQYUdzYN1HGnJTDabfNeQSSE5860A8TyeZH1/QDzGDPIYEiwtcNrcfca1pUzCGScjhYHHA28VXfXof63dhc8BzzYi/z217s3zwCC0Sv6kUbnKl3yDlriuaYQ4YNuSIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYeERTmq96yPMYUqdE10KidCkH/2TbWLlIdpW85nUbw=;
 b=sdE9xTRMpeFKiquTxomp68PSm2gXI5htNMFN2XVAYHm4Cd3BkUEfX2OA9pC5av1U/q9O/Ev/7qTT7etKCqoFhSkEJmJAc9tMM0QC1E9/sjS7xojb5sN1pLWweInNBar81kFk4QarX/uJqVZqvDTmQFxCj2xayEZOMFyZdpKUOLrFmckBGQWzB4IOHqBCFFAIJBfEhgE0tBHpiFFnR5otFoPA4Z08T4Qu692dpyYjFpudqc8UHwVK5NtYRwfaq8KcRg0QbO8bjrjbvtpdizlZMkYsXy2hBSS69utYIZ0llrW0EBEMlAv+n6Q0a1Gz7TFFnhkxkW8m/a5Nb9BdsQdmgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYeERTmq96yPMYUqdE10KidCkH/2TbWLlIdpW85nUbw=;
 b=OgHR69O5UM2yk7z5erRfbosaUib1RVeSi39oyGx894bYLicpQbAesu6uUtvnTSjx70c7IYZGNoU/g/Z4eMac+Nwm8HaH1pOwYzv8h0OFl/GQI1EKX37cgCS7Qk5dPtRuw2mhcrJdxqkGzs6s8tRBgjOw211OpPrZFPaHkUAKgIU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6232.namprd10.prod.outlook.com (2603:10b6:8:8f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 22:23:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:23:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix a minor comment in the fbt provider
Date: Thu, 15 Jan 2026 17:23:14 -0500
Message-Id: <20260115222314.7290-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: b778868b-3565-483b-d98e-08de5484adc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4eUeZ7ojjqvDbFtXiK5ji3vP3YMj5BoBc7rRkoQdoKzbNnurkhMjWDUY9K85?=
 =?us-ascii?Q?+juMoPPUr98jQ18nqnqrnL/2mdJ+ZG5WZZ8uuaLIoqBKToqpVq8kFHnXcBSn?=
 =?us-ascii?Q?hHI1Pj7ILF31cQaCzGpK2LUSDwdfY+GLVd4SOwQs+xIP1JQYq4sugk6pVQRz?=
 =?us-ascii?Q?bV/qtdRXN7CmiA1aHizYVW/946pnTkfktxp0t269y1m4DWfQWTP9hPW4LphF?=
 =?us-ascii?Q?Y9L4OX2xDWusVsl1w8GgloyAn/CH9YBMsXt0HzAhrCOZVtEENw9iJyo7e1qe?=
 =?us-ascii?Q?H+L17Tk2W16E6p81rnud2eN8IrbdMKg8/Y5DNVZdP//nGIGOKGUK5PtjKarP?=
 =?us-ascii?Q?kx/dDcA721WN6Hb6XHvSsmKtdgc4GrXkNkBYbIIc2dVE3F1PpuLRCxesbT0S?=
 =?us-ascii?Q?FrClcCY+5yK1ISVe97nMYOcQaNfLjqSzI6JwzByZvxb457uRG2QDhjnazR+U?=
 =?us-ascii?Q?CBvz3MV64jrIsLJIEpKqh9QcrKRZ5LcJkHir5OLLshQiGmprhiCHRu7o3oEr?=
 =?us-ascii?Q?U2FS4YRO8fIeouFi7cSCr+HXkisv3GG+MwFsGg+ZJxSpyKOj8U+BnKJ+gj8e?=
 =?us-ascii?Q?yGIdpBYoo0mLIiEWcdRrQP22q/n13knlfjFzj7rW0mehiLbHZbyK+7ykfFZS?=
 =?us-ascii?Q?hSpuOC29wHIgd868dEKxdfH37hutsfspNnkXmfnUrxqRPTRdylmpY/KUmv5L?=
 =?us-ascii?Q?t9e9UE9sOd/4EI2vLUJA+EuAABpEeqt/1sNHRpfuXFjtzoRkfTTASM+LQLHW?=
 =?us-ascii?Q?Ptgv7jhK8SbVGlmT9PGKtRayCxWkcjaRLGDVbkDzraw/m1jfPjWHvzXzDvQM?=
 =?us-ascii?Q?jfLvfxvDlcVzAmkd6BmeyfUp5CwQRoAQos03XljsBpz2uBkzOD/PTxFIuYk7?=
 =?us-ascii?Q?26VWMEnFoGFI5h8mN83YkLznI/tFwq4lf2+dNRIJqQRL/Op2Zb+1t0NdjIkr?=
 =?us-ascii?Q?zgVzApRvc4lQfEvRvZ1wDO9N8Z9x7SC0OMiBFhjgsjHfstg5kB/VWwJcSLGI?=
 =?us-ascii?Q?AoG6l2WqGFHtRWCkMYj5JRdss7t6tPghuvEsxeon+Pu35UZLrYORf/tR/bS7?=
 =?us-ascii?Q?gteItSN3Lzlan5ZOUynAgBuJnLnkJpZIW+wVc2BphpRNAmfoOboXcz3kk4Ev?=
 =?us-ascii?Q?Cfm8/sX9K35j0DfdrUikv/QYC/bCwG/P/+ggdlQop2i/1pwjLfY6uMSHjhg/?=
 =?us-ascii?Q?ES40TkRX1nzkWF9z+JmXas9USvzyXLRChLg2XAUDRDoiEJ8chpTiwr5Qs8gS?=
 =?us-ascii?Q?v0blMelycnTVTESCiTOgbVI2+P16GZUFFwzWqRme76AI9FJ6PPZqswiEWU7+?=
 =?us-ascii?Q?IrDI8fT/dckaBFvIF1lW9lRMejVPLxZHJOpANKgOX6Q5DtK3gOalw/6USdUo?=
 =?us-ascii?Q?3lUO84EbOifV5v4X9PBk9CWqtXE1UQP648BNh67Ts/Dmi3H8Ll8LHSVlc4hm?=
 =?us-ascii?Q?afWnaAo2AwHFvAEmeh40JBGcOHPqrSH+6VU4X2DkMl7OXu3g8sZGdFE4OQIX?=
 =?us-ascii?Q?xmnZIzG9ZknOi6F0BuSA1SFzZiLJAJttWFikLwtyuMIh+OqU4O6QHzNiOAeW?=
 =?us-ascii?Q?mh7Rj7tfiA5WoC0i7Ow=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+PPYER/eo9ppzg7zI4RbK6FlAW6L7wYZ/tSayG9gPKtxM1eu4jhboxf49QzN?=
 =?us-ascii?Q?XGt8oGqApJWewOI7y+A/S7UJqSAJ2SOKb1YgCZQzTw+omYJNtSvpPKSEMC5b?=
 =?us-ascii?Q?mz3oeovAOt09W2kMpAIagWrKPar7LntT2b7HUvrajjltPFqS94LFcqFCJwLv?=
 =?us-ascii?Q?Xgr6g/t+AcT2nSfcPIma1znZGYERmc7H0vd2hcbyC8yJyRwsSJpoWK/uYdxI?=
 =?us-ascii?Q?pH9DOZj/1al+43XmG+kj/XJwvB+xiCvOuD4o8BVZyH9KbuZ/hd1vIV3yR7/C?=
 =?us-ascii?Q?+S1ISkAf+8pDCMeffIgIIgBwsgYD4s1/gL8DB4TyATRhcEuIucN+s0nqAvBx?=
 =?us-ascii?Q?G700RSnUv+/w/G8NDg6LkQu6ck1G5zAFddDsUdyZ52hzkhet5G2Zy4Nu2wDn?=
 =?us-ascii?Q?jHTECdf0pVu7fP6YdCOdK5PYmk4ykQJNw8la9tgIOZEbWG/C5XYu0zPn7mzE?=
 =?us-ascii?Q?+eR2C9C62OrQeFRBnmkYkCjmdLzTJQ3azP+nC1RaTgsKyG7aq+94K+2LBx0H?=
 =?us-ascii?Q?YQ4/7defKXoEMijVkCOWtT0wYPi+IbrAKemmIaRKstCyRydBgutFth8KZpxi?=
 =?us-ascii?Q?jYgGIY0Z1f1/hWP/rgE2EG3FIJSEU5seRBCSHLVZ2bir7woE2WxKnFA2nOzs?=
 =?us-ascii?Q?DE+1YncbX3OkdO9cC1CdLi9x9JYt02mUOLNpVvzq7KV6yVoA4M37VfdAG5eE?=
 =?us-ascii?Q?36PZ9qA03uT2d0OOI/m43hPpYpwH01O/UUD9oyZmu4Uo0t92fTssGOn4WWBj?=
 =?us-ascii?Q?VEp9unpv2MkdcvkdIJ0gKaGBuTwYhlNm3/oH9sY7M4o01FqrD/IFosc5jQdj?=
 =?us-ascii?Q?/O+pVS7PuBu2q9pCJWuDJihbkkfyx5fGTrmZYK/HEBMcaGhEILW7iq/o5VWh?=
 =?us-ascii?Q?wFeeEZFkuFy1s3+PMp146HiGoPNCna9ymtuzpGTvQGEz87K+mQkz7JesEwTn?=
 =?us-ascii?Q?dtZSnyeRz9LN2Mfpx2cv1govyaXE8+0g/JWEX/eWFpinfGZNgn6fcM/ERv/i?=
 =?us-ascii?Q?VGHo0tbuNCjnV9aa9K9DyT+adtHqZWQ1oBbK0pQqiO40VXE+ZWq/RId8EFqU?=
 =?us-ascii?Q?52SuQeuhXU1Gs3QrtGD5wYS6HM3EqKjEJGbFeNTrBa1i3Gke8RG8wPymPvKI?=
 =?us-ascii?Q?IbkVCuaO8VGjDW1SpM16F7EeIpnYf62w4ofOKUQdobB7hrG4arFghta8CL3E?=
 =?us-ascii?Q?fwgqAhtHv5bxJbajnsRk36/dxpMusaQn+rOlDmXzi35laHYwBDCATZt+95M0?=
 =?us-ascii?Q?ayQtChO7art5JsaTXGs5KKSZ/M0+TtLvbZnU2/sJ89CcDfwKQlnJ5tDC/HH7?=
 =?us-ascii?Q?FHI1Nq+TFIizp3QP/FCmc+SnaavZPivNvFD6bXRfAExqRa7Wc187HhJ6V6By?=
 =?us-ascii?Q?1fSohMidLY/NFI8eBo+p+x6OMb0fSIdZ5p89P0y07W3dy+rjItYuNV5FliWi?=
 =?us-ascii?Q?edJ8lIZnmrgU9cBpcSi/zLFgKFhflCyYPMlVDlirlX3ivLPdspG/fB4GhuTM?=
 =?us-ascii?Q?wjJQPqCfwnoTuGsUFrNjkL5Zprdoc3tT4WeOApCWwdthsuzxgNLZd/A1wZpx?=
 =?us-ascii?Q?i89S/vd30IEMWYwGl5aIfZjB3TGdOw7eBgVF6re6Or3iXJ/Fw5Jb0/I3GQVe?=
 =?us-ascii?Q?PpN2+krcQfK1InARPYBu+bv39O89ZhRyHVSHYMAfK9MT5o9nlkga27WPNvXw?=
 =?us-ascii?Q?1dxQk3s0O74evdR04a2F6nzFnG23ZhMn0IUqPGetAXxZj2PQQLYo7N+Od4aY?=
 =?us-ascii?Q?rYTSjaPUVA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G23lSBUC5aa7e4CFqpNNXnKUghQc8l1Mwo69sRpyqZ10ZZ/LXS543fs95chyhMxTx/HKea+P1SyoUHG0CWLYLaBCTAwcqQ27CM5olDThzeJ4DqA4GwA9NoSa62Dfb5VIUUFSJtDf4qO+OmxyQDDiAqJIz2yZj2PyDT8f+sbGn8Be/w40/PIOAwrqEFuqBlu4vcw6zbUEoY38gUjlYomdy7J5u7hmu9uyi88BvLmFQbAcQqD6LDh8qe16v6Tzix0NxMnWOtX9Ahn95uFWR4B864PidciNwHczUSn74NuWcIGh51cRl4nHlGVTKMNDEAuhh9Vnu3eldOvfiSn9nqXs+yN2olqBVLP5uxW39vbkpAh06qW9x7rk+xFL2MRpIXCti/I3dCP84UJezS7ZXG8Y6zNBFQYqTadyvaJ4aMdRZwkPcwg1ZHhFMwXsc86YODsDwfmH49ARdhBD7HlTtXNHbWbAsedf8m3+9gTB8+IR8nzEpWCmkrDQkJ1Vm4kIPcdGWUKj06RJVOKyedfFfWlx8RylEqDwJoizlxLxCzzmitHd3FtyMZ3dLtirLZctr1Gvm6kbOSEbumcR/7OQn9Hu/Q9ByAD+ZiQo/lAAczHWrII=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b778868b-3565-483b-d98e-08de5484adc2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 22:23:16.2099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kB985/AvxXIa/H9jZQydfid4u2LMWm/dzrZt5to0sF/f7xUeN7lT2jrswVwCSrnYXf7xYobcONS+xoUiKFLDTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6232
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150176
X-Proofpoint-ORIG-GUID: 5P0g8mX659-RjUk2wcTz03Hk10j24CZ-
X-Authority-Analysis: v=2.4 cv=YKOSCBGx c=1 sm=1 tr=0 ts=696968d7 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Zs04hs1CIDI4cnIeEwwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3NiBTYWx0ZWRfXyyqJon6nIQvC
 2oZJTC5yuTNqLClkgC0OZvXmIz5jyPUTI+o1X5A1hKS3H/xFeZ/Q2YOldbDZ7s8nEtmT2J1rdxZ
 AuPMVQFRJBOsO9xrZVY21hkTKOPsXRKVYE9T+3EIcULGmVfItizBPf2+fpPY9gxSvi7L0nYZqLa
 QZnC25uVZ60WxEQITzNaxnwNRDcV/FBsX8g3Mm/qGH8BxiBwr1voUfcBznV1OBmlY5g7KTMm4U9
 f6q2a5kRabqttPFonBI5cUY8YQAmuQDUsRXpSKEqGLdD5EtOVcjqxXgh1th3BIaC5KG4EBwoCpq
 jba2RnPjqWdIEIDzrOmt74IQUoN0FJ3nsp17ZmxR3Nr9vpM38q2wccOowZDcTLiKt/R2lxuPciS
 iCj/8ZOz2pu65FquBs/ROxLI1eZACpftXYEGcOhKHrn5CsBOigf4oZVeK5HR5RoMj302nf9mOUC
 +jA+x75H0MEER3Sp7Tg==
X-Proofpoint-GUID: 5P0g8mX659-RjUk2wcTz03Hk10j24CZ-

From: Eugene Loh <eugene.loh@oracle.com>

---
 libdtrace/dt_prov_fbt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 0ba209882..7f4a4aed5 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -228,7 +228,7 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 		if (!dt_symbol_traceable(sym))
 			continue;
 
-		/* Function name cannot be synthetic and must match. */
+		/* Function name cannot be synthetic (unless rawfbt) and must match. */
 		fun = dt_symbol_name(sym);
 		if ((!rawfbt && strchr(fun, '.')) || !dt_gmatch(fun, pdp->fun))
 			continue;
-- 
2.47.3

