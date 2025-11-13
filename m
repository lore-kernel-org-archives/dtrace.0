Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B2415E97
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 03:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763005410; cv=fail; b=mWDSw0N9Y0qAcVjVxKsZFNVKElKPx6lLx0ckVWAw6IIAFyuLkEKHPcOy4EsGDVH5PyCYRvGe1+9B9Tj6IvuWqO1XskV5iNecumABzd7hz6FFVEvzoOPRmJXFyVmXF9uDGRj0QF9MnK0Itaap3+myUVnOKyeOPG6tLpAjsB96JAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763005410; c=relaxed/simple;
	bh=NiPdDoVdGL5fb+Flp2zNlt1+rLP6kqnKxZyzZIa0jUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mAP1OuUgwEiReNhczRWX687H6ZBjYK3phZe81AZBvOofApqMjZxTtrVFz7cXri+mQV+JcOrVPNYa2paN8Y2Hzr1kpL97LNnXsJ0WTPVqcSczLXnzUVNapzQI5QV/QhiaALi8ICQQGikP8W5cjndd9FxzfbmPv6TwLw2gSAf8wm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rJzuef24; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W/1cJRT1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rJzuef24";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W/1cJRT1"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AD1hMJG016636
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 03:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6zffVrOMHU86DewNmN
	Z8TCwz2132E8hC7rjSy++BSrg=; b=rJzuef24ezaEbrCHDv/Uz4KPGHts8obC1F
	+lQmszsjFMdi3CkYYK3nDilN0NJS7ObpRZvki7vM6dZKY1vuuZbqX994fCi+Csrk
	+6Mm9ijBCpnR1+k42oahrG5wygwcLZ6hqO5fjRc4d0xb6kSp3nHjrtz+9OzAwCJr
	NTY2AgOc6VajXIjWdY7kx2rYgZCykvDiFj1WGdfmFeUd/Jxxr59+1uSFCE+UrrOl
	RIdKcW1Y33JHcQ+26JA+W/VF+D/MiqBP7x9+a2v/aczOctcUz7FGlqYDfr3rdD8k
	s40HsD86VZCkE8LgNRf/HPZP8H5/l/Vi/MjLDeK0w7q9ZNY+2uMA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acxfvh00w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 03:43:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AD1iHGw009927
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 03:43:27 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011040.outbound.protection.outlook.com [40.107.208.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vac3hx9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 03:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miEspZitZHDE5xZU7JouW9an2G+l58zaFkRi8+iLZnsLLFKIATUJAOrwEq8Mp2gzKp5T6dijKP24QI0rLL2IUXyk1T/b6wP2iYWk+1ZffLawj+5TEC2hPFjBEeA9O+AEuRjgpkDzjsUnkddTszIKSiIFYQ8QafII3lJO3kyJxtpHHmk82cUQqTDLvAoPuk3lo2+OZHUzwv0qTr/kED2pnu2G/KkAmnUe2dYQU9SmxuM25gK60JaGuys3MfZyl+jBre5zaTUs7MV3UzpirF+odCziRFoLEJ0kWjE4evPUuiZIbKcs8DyDLpLw/qXp77JDAAnD2lxadUqxHeP6XWSaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zffVrOMHU86DewNmNZ8TCwz2132E8hC7rjSy++BSrg=;
 b=y7ME7EOv4cKri7UOlfG5GieL3CEqess6ijyfBpKd4fvhCCfovKCCy+1mUKwiIsEl3n2y5xzL5MSPysyeAnH3K312SS/LQ4cE50/VKkZ+OF0QlFfYdNxXdXClk7hT/3fxNCpLpTBCVLfilDX9hF6t3fdeoOFN/PT/xkWS08p6R0K/pwMpscrIaT8DkArSmUVIkYrEyKUpoGzjrgD/myf5M0WedM9VbvdwMaV+St1iNs5NS9mETKs4ee5K+GJr6m4nEBJy7WzTkWu3TXRWo8U26ZchQAoT9PsEEKH8ug5uUR0gWpJOla8Yp4njl0gI43tuP1YuhI+Ue0eiTSF06rsbVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zffVrOMHU86DewNmNZ8TCwz2132E8hC7rjSy++BSrg=;
 b=W/1cJRT1l0RhNCBxkc2W8nZh95HZbuh8P0yfEVaPdqIbLLF4TQYnSJUsb5JouG5+SJ3xlrCSoLbCUchMvo1yxPIO353HTQM4DB2GULEvM5axOSTXK861xk8ItT2MShqdY56KThx9YQqYp1NaMjfif+gjXybuNuMeD0oeZ1Et1Xs=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by DM6PR10MB4345.namprd10.prod.outlook.com (2603:10b6:5:21a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 03:43:24 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 03:43:23 +0000
Date: Wed, 12 Nov 2025 22:43:21 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Skip err.1.1.d
Message-ID: <aRVT2QrncgdsHGBB@oracle.com>
References: <20251113001753.26276-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113001753.26276-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|DM6PR10MB4345:EE_
X-MS-Office365-Filtering-Correlation-Id: 0157555a-e5a7-4e8b-b15c-08de2266cbfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IYaMYLEB58i0BKeyiltu2YQBUgR8ILfOXWdqZ8kWavW8gs5Eta/8QuFGb/dG?=
 =?us-ascii?Q?8fMGpgcLzb2qizb/opfabAJN1KPorX5slpgVwSuwM4XRDiYjkKQs5D0GthIr?=
 =?us-ascii?Q?OURPwIPhzf1Nq8Dhi8cqX90UCl2zhKVR4W+KaP65aZZVjeVzSKRG7iajq/7J?=
 =?us-ascii?Q?O71roSGJyj/qUutUYE3zq6ktxAq50GmiceqFPf8HEDgsn35XU9KspXgQnqAV?=
 =?us-ascii?Q?ZsDCYBtVvvXKpl9anOuhfJ0a1wQmQA7EZr95t9bX60HltZ15d8FT6nsD/LrX?=
 =?us-ascii?Q?HNsfURKnBEP616k5LoKB1Dfk/O+4klYyuCx7a+ZFp6DsTY5wlK58MKslmGgU?=
 =?us-ascii?Q?0Y4cU5rJ/L+wv0IxjXPYUiMumCscfzZoRP/tMsOrmep510LthYtzcQ09E6Nt?=
 =?us-ascii?Q?VuXFcsikaIaTDB3LqxXZj/0qlQhekfFoZeS4z0YbF5gGSX8H0QeQg5/nYmAb?=
 =?us-ascii?Q?Q0HixL3iEL9xZiwJ2vTwA9X9AR8WeJEwJyTTwN4ohoZNQ9cgg8V9jJL/vxhL?=
 =?us-ascii?Q?lNGjZFzFJ5gDaivbkNRE37XtG2JBPEeb9osEMQ6/VgX/6PuRVhoBDHnToYjM?=
 =?us-ascii?Q?BrAyma/2gSYDti5uPy93vNbXBS2Ra8konuoGFHDl+vGJCZzetiKlbkjopqS1?=
 =?us-ascii?Q?AJtCjCEQmlJcOSJKZc6YV11NBCsCeqC/ryuQ9UQExmBR6AgTjHo7DWHUPMFU?=
 =?us-ascii?Q?i5gUhXmVleK8MTXia22/9vRymrE70DZUwR2sm7tAShmNtup0b4c6g9lBorRs?=
 =?us-ascii?Q?1R8cS5vAbQDaf6W0iiJvF44lmMVFu9OsQ74uEae0k0TL4YAMTVGnypbRM/ye?=
 =?us-ascii?Q?Eg+DDnPqAejdIqPYBDVR6OXhrIKYOwkFSiCzp/bHPGioWWmpxKflVpp+ejGb?=
 =?us-ascii?Q?qfEPrdH9OK77CexrMNrrz7RN+dpT6US2O032RATQHr4Im3svPYbr6hKeVcXW?=
 =?us-ascii?Q?oVVC2k0NhyQbMjJel08l34/X9WxCMSkXt7kZQcCdX8d/hIZUPIiiFOF6mXOc?=
 =?us-ascii?Q?JmPeEYF6KWBIk5e0N5exazZvYdWUa4oR2S2OwZbvxkDEjoVQkgbWA6hKev55?=
 =?us-ascii?Q?/j5tlAUNwdmmw5d5sF9McbHyT/ChO5q95SQVlNsud60cf8oWSSP1dLG+9eQR?=
 =?us-ascii?Q?omSuxvNSy7S+bdrl1oBpvCEuimx6fScuG5869JWuJVrmr3Id8Ni98ZkywXSb?=
 =?us-ascii?Q?cqyizUTljg6XoBfV6mkWfk65VBo+Egr4YGFreN7gL9Ta7rpFHOTw7tqcMj+B?=
 =?us-ascii?Q?YMECkghvC7HRpxOH7B1qMVAFG7vaGWtFCAOu+4wyDtCeTVIVfHSVVo1onvp6?=
 =?us-ascii?Q?m0zt4a9ZsXnbYy/YXgSyWNTHTX7XALzC7mB+9rBSNX1nZ/1O4wVYOD3FBT3W?=
 =?us-ascii?Q?qQneClw1aHchHULDLvH+JCs9LtUPqhntKnM5dqFQNZ6x3ToeACEME4+6qmLt?=
 =?us-ascii?Q?c428WVBFICt4stTsR6YJAqp7rmPhBlPTA+Q/Ax4MJdvEH9kCPX7L4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+m4rFFt+m1o5ICv1HQ5ViC4atREk30W5yRc0yUvIuEyt93sHSRJuilGqb6Qm?=
 =?us-ascii?Q?btkxst3wnfgTIfigadmoluheqtWh0KZZF9VYg5bWaemw4P3D6Hm0lz+CCl0b?=
 =?us-ascii?Q?YLdGRbw/0rEwKgzWNbxUsyK2V+QdBI6kCqYUkT6qtOyFOlcgE3w2uQ2n27KO?=
 =?us-ascii?Q?kESXNp1RYDfmmV8k0ju3SWSfyffMRABiN7Oop4eAnTXS51tAGqbUtOC1tSYp?=
 =?us-ascii?Q?PbXxEROrSRGVEnL3zA4p6aFNj3EW2IHihEvjX/esXBQqeQ0Na8LDEG4FKa22?=
 =?us-ascii?Q?W/YHTEnUI/LMWeHO1SlRir3LluFpp8ilELo/TdxtfFPvxivdrSRAUSXOKGsK?=
 =?us-ascii?Q?8lxDhKd73r0mZe8uQ9fu843VV0I0pwGdgr1X21ugTzv4hi8UB5a8OzRPxItA?=
 =?us-ascii?Q?uiCHE3CYMF9NnaPVBsZyuHt9ExrHezmbXCnb0thwn1Z94xlPn0E00YHMncfL?=
 =?us-ascii?Q?dfW7n0wYQkAvbFXopRevz9mBuGEofdyHcmGa08IjJhSrwW0PsZHqd8qEDJNy?=
 =?us-ascii?Q?V1cqtHBLgLEUkafhxZk7HqlZupt9qbpWSMtKcLecIRIgf65HHW2LBKfNA0Ls?=
 =?us-ascii?Q?P4kWFGqNQKkNk1yLUnJiEFSRCrI6iw9rGuJL8QsE1/s0c0ADSEaSr5Hwyjtn?=
 =?us-ascii?Q?DLu7PEwvLjXLd5UmsSsnf47H3EjaAO9EJcu/gq8U4naeCYuzZPTFRlunqMtv?=
 =?us-ascii?Q?Y86mLyx5d7/UuhUXz0+PMe1D02c1Zhh3ugTfbECnXKYpJzVwX43XWYer68NK?=
 =?us-ascii?Q?OONS8YG5o5SWPtJvl1DBvAsN3RqwGKlKGhJAAzF2dQYjfWOGBq/yRran9+AR?=
 =?us-ascii?Q?ALQmvP6mKCcP4ECodps+Vshxc1NFqlLkC/kgwmfgsSO/wuety1zN/vr8i+uk?=
 =?us-ascii?Q?xZ1M+sYJJA/s2QS0/c4PKPuyHA+Sz8ws90lnO1hjhYsxwkTdr+utub1IjW/j?=
 =?us-ascii?Q?AnCE9oNyMYS8ZLQjElZA0bzCGSGnocxzI6w2IJncJor1+NhJ/QS2KLw1idMb?=
 =?us-ascii?Q?d0u+scAq0fOKUKgyV94j5T3Ys/gVOmzcQDUbNXPhwUH9XwRnj8ZwEL/sh6Am?=
 =?us-ascii?Q?KB19tUF1ai2Ig6YdCWPJEZlJsQ/x6+GXIyyPWKTtAK3c1EeZi/J/KDa7JaEn?=
 =?us-ascii?Q?rXJyOmMCi9Q0O2s++6Mr1L9zQxAdnR6umTnC5+d/60Z4X9Fk4TAdnHkUMf/D?=
 =?us-ascii?Q?Ibzox6l1VlXt5dc5NV7wy4E4yK8CW+kUj2vjaHFcmvOd1DFkn3vDLFI5wdex?=
 =?us-ascii?Q?QQP+8Jc/anv2k5+6yR8Jm8scOm++WqJHpNRQRChEQ8qBzInCuuFl67OQ80Wj?=
 =?us-ascii?Q?qrz5lVFEb85yr8OvhlIlbM5DdzA6HM5fpqa8lGCwfUJYmc8rsE22sLXNY9s0?=
 =?us-ascii?Q?1q/Dfd+CPPqceeVwhtQ0HXowbIZM2eFJx89JAlF6pcQWfBH4V5EKTvcgdoOk?=
 =?us-ascii?Q?Ign1UFJMSIELNWNL3nZWDbaW3mPoUvBem/MNHQQpLpZ5mMJeTrIFYrqyOsag?=
 =?us-ascii?Q?FI3Xj0bWmiDPahJSQeY+NHWP+M+35/w2ARzbAXBijZ7U4JWOtnXo48Zl3ppL?=
 =?us-ascii?Q?1u42dwYFPdM/gyAYUanuh0ozavgUYmoOrnyHhr6UoBhLlaBnr2mAvScx4sa7?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6cbK2OskyhwZOBzrBd/aenw6Q9uyoNdi/VvCXSuHyJprvhljdWIm+8wQqMXTBfQudqnpyFTfKjjfkC4mdjD6aGM96C/dZTMJzCMOo73YRZF4b5q2RNwxDsvMFXzgay4QO7iO66Mls4OKCmNwymoA0tiwCAW+Nb7t4QV7z29bJPNgfuxnsgTwIAkcpGwPgi1jFEV7IMMGerPdYdoMukNI/VknZyB6sLcisyFHM+YQGNdpxNEH4gpkgx3MmJe5qsYpFZLeZ3MWKjo0kHUOli3uApojpvyufjHWAKxWHcnM0rbIEppGVL+IIutbsa1918aaChFP9mN2jwCHqa/wl7jvam2uRdM+WWtENQumNwIcoMNJHSIDXIrTsi1Mn4cAW72JxS5do84qYEIMtgA5aoH9CfYOS8dcrSjffSWiXfwrysRzzs56swtGcEL2MTqJwrfGV2ou/BZuyHT6vYCFl92aoqWfR5ww+A8JUN3oECI+b3dJ5OaGKgPqHvicrhchnm81Bw5fN0PLJLU+0mRNYfOO4AYk0FvkTyhY+50LlmH6HACp5OMoiD1n6ptRk4DkKbv9qR1iDGkQJWlBjJ/wpZkofw2VHshHAVjOsfaVWJMwJ68=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0157555a-e5a7-4e8b-b15c-08de2266cbfa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 03:43:23.8557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EA9iMkrCrsPVqKVgMLUdMb+CBFrba9iPtC66ONy6uFD6vn+ZDad2D99oWSgCGdApzgp3G/+i7GiJwPqcAaXKUptj5nGS9vGcPaD1ESCvmUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4345
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511130023
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEzOSBTYWx0ZWRfXwaim9pEmLWEo
 8vE+Ekz/fpg8/JggdiZYNfgdtEUaYp4GdM95tZW+VXrIlW+j99qnEwCvZ3Tdw5BO7omxnn4Pw6f
 GDGiSJu1ySyiu9fXkLtEKBg9X/TEOVOAtq1yxbcpxTLy03bEwPbHOSWP3nBofkwpD9Er99oPYK3
 nAIr6n5Guzq7Hb3MDYZvEII3rxxtcM84ZrrEYO6tKm9tKsi6nBs/Sb0Y9VJ1vTITc7cCMGw/WZZ
 rN7b/7h7PB/AIsQHWg4mIi/B93l2PdSVLDJD5GYJBuYwlMxUoP995JD/+L7Idls3veB6p818ONz
 oRxR/84k9xBtYcrBZW5Pn/6TAVEwziZJYnYM+h9DWUN3sGgsi+dI6RmDtNcFFcENaZFPWTqxEbX
 KNZNnHNLrIqRfym59PW4zeUnXxPEag==
X-Proofpoint-ORIG-GUID: UXGsu5DnL869f1ZM4SqNgDg6Mp4C_QWB
X-Proofpoint-GUID: UXGsu5DnL869f1ZM4SqNgDg6Mp4C_QWB
X-Authority-Analysis: v=2.4 cv=FKYWBuos c=1 sm=1 tr=0 ts=691553e0 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=6mTWHuwD_vXiDxj2cUwA:9 a=CjuIK1q_8ugA:10

NAK - we should not hide this test.  It does not impact other tests and it is
a genuine problem that needs fixing.  The test is doing what it is supposed to
do so skipping it is wrong.

On Wed, Nov 12, 2025 at 07:17:53PM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> There is a known problem with this test dumping core.  It is not enough
> to XFAIL the test since the behavior is intermittent.
> 
> Orabug: 38615307
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/version/err.1.1.d | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/test/unittest/version/err.1.1.d b/test/unittest/version/err.1.1.d
> index 0b63421f8..7b6a95a3c 100644
> --- a/test/unittest/version/err.1.1.d
> +++ b/test/unittest/version/err.1.1.d
> @@ -5,6 +5,7 @@
>   * http://oss.oracle.com/licenses/upl.
>   */
>  /* @@runtest-opts: -Ze */
> +/* @@skip: Known intermittent core dump Orabug 38615307 */
>  
>  #pragma D option version=1.1
>  
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
