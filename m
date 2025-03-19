Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D346F194A44
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742397493; cv=fail; b=CbMjOVCaz8rA1oQzvVhZVPBsuNawLcIJ2ksDbC5YJVhbUYaFQzxQXfT8LbvdTpO28D9Xc/JD3MPPIcnPXoRo4aYisByZ7dm0as/pgOzAa5z3N0UrCJAZ3oWodmANGw+RKVVYIqeKcZOZdzgw+VibTW5iE61ChI6u/zLxT/lKiR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742397493; c=relaxed/simple;
	bh=E/34z8d4HH7erkLogXfiBNY0rNFuyP819pcT6W2KJPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oQCuA1K+iwpUg4yHAqNFYS5DaI0OHsecB8metxkWCLeLM9DS4XhQkqBKK6iMfPHZ4hWmckv1KL2+mgYLQE74bpgu6mpkC1NjlBZsR4UDw3uEVRyWFOyxYTROJ66JL+P7Tzy+LCdLF+7bXgGCfO7msse1HdXWQnU1E6EBr15ZAkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BD0l+Hf8; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ceeDQmtI reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BD0l+Hf8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ceeDQmtI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JFBuDF019034
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 15:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Ac4KWA/GzvTgUcwgt2CoozIE/BAGMU83+MMUwhfmhao=; b=
	BD0l+Hf875aNzoje7Xq7sPTs4iab1FMkDA0B5Sg/wSYchF4o9mHVUsXGtaLOt3Lz
	5jxWAJxJ+FYeWzyIDu8ftMFMYxWJoWMADsVbDZ6RrWVT8qb66ZnUIlCUGsNd1JB3
	kOoZC25CpW4sfrFjb6eu+lQPWhiDRvVN9XB9JK8yBXkEK69bRHJ6jvSO88YNt3Z0
	u8ppVUe0pUuYbLNCFDcvYm8RSjMZX/PHt/uon/UPq63N7apcAdnbYecx0gCBzm64
	Qid6A1wQoNhGS1j/AKuou/NTmc1i5vebp/J2vr+nlbDQhQoi5rtV3GXaO2YVXYuc
	Hf7zKvxlUujKo57dA+ZIsA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m13ggd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 15:18:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JEZJQx009760
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 15:18:08 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxm1asr5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 15:18:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y36NCCvmkmOYy9/idwuMB0nWKJa5OdQV7vs60gVYH0+H7dppmgcJyPg1/Gr5/i9tlUK26aKpaa50L0S1ft2M1PI88M8it+1uzNA3fnJDvOT0XFMDb5vzN3olT24U7qt148ch6TbY+EqR5yqf6BYxKsZ1x3BVnVDrf+ikTQnrUMni3tZspvQ349d7czPScZ7perQLsne2MYNhyQ0dqSiVZJG6RNYzj/Ql7eA4wT+DDVpAKxzBVqmdCubwoxpPatiOMjYIgORQ1nE2nYPB+T/ULkHKFFKpx0YEfxyNe6zEh8dRn6idM7aMqNzRriqBEXtEivRrqGmmTixPwhN+eu3j0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qrf6XQLjCpj23tqH6AEDW6PF1dtchqC5yLxr2vsOmtE=;
 b=ikYYVBhpQkFzkM2WXqLOxR4qG/f9BIseW/qpzfxKOpdfLkLW78ELr7WET6a4iHd7j8gEvVJZ9sIj12iSMJo+XRBBNTlg5WVgkeNxln9r1+44041wxlLGQD6qt245pq+UO3Y2GECuLnkdZ4g8qO4Kfm4qzs0LIKFcZxY+zz4BpKonyLpKL6VdBKK4DqSTBU22cLr8WzoOnq73zG8KYDpuY9Ox1XJzbN0LuKpVV12rUv5UzC8XQvBOACbV+Y6xXKnmFCfy5ZpKcli4SH9bjUtgjqDofMYJ120a0Ll8+B2DnUuEKDtFfe8jTaHfbK5fH7h0f1gva1VKVvf7FZrwJjjspg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qrf6XQLjCpj23tqH6AEDW6PF1dtchqC5yLxr2vsOmtE=;
 b=ceeDQmtIT5ZaFNtK99RcRVlvPsQGW1F9K+D7BhN+If2xsV5INLKIoLzmBDtSr5qLar2KCb1VA0SqSfcXpPjb8g9qynVXtiiVM/hW439cOvjvHHvb1MWu1j3ukuMwpTef2e1nmyWxDsm9qm1M6G5HVAw697LC7lqw1zN0EOMUD+0=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DM3PPF51A640DE3.namprd10.prod.outlook.com (2603:10b6:f:fc00::c26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 15:18:06 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 15:18:05 +0000
Date: Wed, 19 Mar 2025 11:18:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev
Cc: "eugene.loh@oracle.com" <eugene.loh@oracle.com>,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/2] Clarify how the usdt_prids key is
 stored on the BPF stack
Message-ID: <Z9rgKzWMHSqLVQdK@oracle.com>
References: <20250220044350.14953-1-eugene.loh@oracle.com>
 <Z9rXYvNQxZqODC3o@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9rXYvNQxZqODC3o@kvh-deb-bpf.us.oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DM3PPF51A640DE3:EE_
X-MS-Office365-Filtering-Correlation-Id: 15867065-db6a-43ea-3be1-08dd66f93f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ofKf5XAlMhokNunraK1TaGRi45FtAR1LcOKaC4jU83NtUQoGNdQQd+aj6u?=
 =?iso-8859-1?Q?/JNacAAjGM4aRmUE5C1zPCMjoJ51bnW1dGt376hisMrHbv8paO7OqiZ/6H?=
 =?iso-8859-1?Q?TcPNBcMiqxTC2TEYFvNhtDkBMKql9WjrYNadXbH19RmcPTPpzMT6o/CUNC?=
 =?iso-8859-1?Q?Or4z6BhjpGhyh6YI4gc9pJ1VUNq6LNgjuF09U8rqy6RklYG7KdDNlHGoJ2?=
 =?iso-8859-1?Q?Gk3D5+AUD1mCVPWKTd0sSKvDNy72qir4TzmRYPntm3WDyDPTlboFpGU1OG?=
 =?iso-8859-1?Q?0hihGOBodZEB2qKxfS9dIPVYNkj6h2rzMMIfwjwiOxejA/SnRKdt8nmPVl?=
 =?iso-8859-1?Q?0VVsr1ez7d8RSlzZ3XeiHJk9PQU1/A4dVfPBvqwMbT3EjVZWE4FlaMDbAS?=
 =?iso-8859-1?Q?oOFM1VUQYHEIkXw7N4kfDd8OKFquevIS/ibeihjlIG1RWjGVYBtZOc+VWn?=
 =?iso-8859-1?Q?9JBm+EULs5lWxXsVEy77SqOp93AFQQtVCB+mEsGdE0zT73rCu6JcOrJy1c?=
 =?iso-8859-1?Q?fkvrS19j3xQVJfI9H+seele/95FlnSh+Xf6LrOVI7zBxzcSKDGeB9b5Rja?=
 =?iso-8859-1?Q?nYlmbm94UTXQbzL+C9GMnkdmYGwcfqqm3vhp4eOnYkmsgc8RKUfl5Hnqgh?=
 =?iso-8859-1?Q?+v6zp5cSRJ5ALXnldL1lDDcXSImrGEJ7xfjjhwrmubr89IDQ8gS0IgUj2N?=
 =?iso-8859-1?Q?KRJxT5a2TpgjksV9KUP8X1gI9u4EBnXIc51T7eQ4vK/SmOVZTFYB/HroKE?=
 =?iso-8859-1?Q?9rrZHMP87PUnfuFL3tEJsTD/ZhuAWCAh1DsFX1pT8S1ooacSaHs1+x2hJM?=
 =?iso-8859-1?Q?9r20hdFEXwo7NuvIZs9KwYF1fq8WV2RT9iKIpWVxbWlZO6N0N1L3Q/wSYO?=
 =?iso-8859-1?Q?NJB0hkUVqjCPMYFBvwUsNljm6kkvH3y7HLYIStFS8eRWAsxdWtMOVM+mBq?=
 =?iso-8859-1?Q?KEMYTP339RC/CN/mIARaIPkhDbdua6kF69X9fhLsXngTIsoBAorQX0bgAT?=
 =?iso-8859-1?Q?LcOSLH2v50oVjqPbBsoUSzU6cLtJnbSp/j2oG15NII7zfyhwh9iTR+qbuR?=
 =?iso-8859-1?Q?A2y2UKt0a7HiXMGj9577lT7MupymLadlj07vnzxCqxzKJb1MnHvQp8qoo3?=
 =?iso-8859-1?Q?Yd2LgWA8Og2YltetxZz31yYRQTtvH67EmnkXxsIRC0O7mz5ZfxXb/n3cJa?=
 =?iso-8859-1?Q?grthiBmFBPo13MOs3UC+vFaJiU/caKl91QMp2npiAmVf2wnGMG/0IRFGvD?=
 =?iso-8859-1?Q?DkGSsbPI6fLFHLIRXUlNo4+K/HXr0iWPpzagPgsmMp6pc3UE+mDCYB1vQX?=
 =?iso-8859-1?Q?DAG7UyT5x3MBuHc+Cl+bcifhZiXFHb9y+iIWTFTJQG5g5oMKSK/0TojZKF?=
 =?iso-8859-1?Q?qnEtpH6R0TG1xdGc0sbOnCSvR/H356Mk/oOKKOW/YU7SReKSGr7/wzyXUN?=
 =?iso-8859-1?Q?VEv1bdhFLMw3jAXj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?4QC3sOZsaZIzqO5ftFZstLQHJn0R6eMekMSBUJX8sMQjcLoEPTSHT3Yaye?=
 =?iso-8859-1?Q?d+5LaYJv0C8CQuWggMyb+V0k/M7yczQNiUT1fKdO++OYwY4BfJ1rSO3F//?=
 =?iso-8859-1?Q?dwgcOmRbc3yOxByn6Z/cHGTWIuM2y8OM+2o4UYT9IdmcYD9CTPGwNY0gNR?=
 =?iso-8859-1?Q?9uSjRSbPff2/2nE4G417U7LFyE49kswCGs0HXy9JkTj/Z33AIfBshoRWWh?=
 =?iso-8859-1?Q?uZbUJbJ5+PW7ykmSyE5ad8odOFtLGQh4f8iC/WztMEQvPiu3+A8e291eX/?=
 =?iso-8859-1?Q?kCOWafGwIXUfwIdTwwjdeI6C9IrowXCVaXU3b0J8e3hyMbgZoT11i/BQzI?=
 =?iso-8859-1?Q?Bj/a5t6ULXuVIVq/oiWy4u60D73zOhqUGXSofY2hN6EyecpsYpUDHUKqnn?=
 =?iso-8859-1?Q?qFQpqYXUJzR7K228WtDjFe1+p0+hVLlTR3zF3HAM4ZTwNxUCNJ8W8NvhwV?=
 =?iso-8859-1?Q?ZePdOGeGRZrXaEPqicjPSevw3ThSMz9uLcmXPJtOm7V610TqnBsTlh2zWo?=
 =?iso-8859-1?Q?5TCCqs4V7ZfdGNNt2i1CY37R05aQOFSF3aG6shrU6bdACv8b9uM571zA4n?=
 =?iso-8859-1?Q?jKZ17btKe26opNoFGY4W/8tx5eCJ1GTXSwgi1KB2kqQoY0Fok5pb79V60+?=
 =?iso-8859-1?Q?QV3Hm7piTgM2RrCMcQmox830cAkDsY9abup9KU07gSWrGQfgUoJGwl9hqN?=
 =?iso-8859-1?Q?/rWPzRQ9X8QSNWLIWnyrlrgF7FqIGnLbqyuSujqyMy9MV00nL9V/BuydF/?=
 =?iso-8859-1?Q?s6VGCAW9Zf6AAArrrnijF3VEUhaxoEpNpzpfDDOu3NTc5NXAwxeXJ3kFPv?=
 =?iso-8859-1?Q?b4NuP9zoYYMW9eft2tovQex+FlEmCafeZQbFeyHvTFk6O6itZ3Xh7YEkST?=
 =?iso-8859-1?Q?A1CBVsL/dgZZyi/a0rTk8oS9ET0NeCXD7JN/CTSZlVhBAhna+I7DU+pkjW?=
 =?iso-8859-1?Q?rpd5w9Dwkn+sLf74CMnnZQGbb8WuUKW6PSxf3PSJAjtW0RXS6CbFeHm3o3?=
 =?iso-8859-1?Q?67yL1r9+YM8QRg4WNJuy20I+y5T9XOh+k09wJb5ltRYLILWHSBg8mWhGdh?=
 =?iso-8859-1?Q?DRYroaKi0hAZw4pqaEVwPqV7Ns0I40V2z4Kj5jK9PDDDAy52tlszE0/aVR?=
 =?iso-8859-1?Q?QTx0/qk+TGuYGOx/v/gtcIQJfzy6EPUhuXcSIN0/HtlXb0NGA7mSDpfGRG?=
 =?iso-8859-1?Q?AJH47yzm4HLMUfNhA5hpfX9MEub2MDAHkbSsXik40xCcJY3Ga16gCK6nKz?=
 =?iso-8859-1?Q?Fl8SHWWzPTvYJQXAPlmiYL8UwzO4F7HNfIRSos96jrEeaTGPYmCL4LMTGe?=
 =?iso-8859-1?Q?x6z4O24bXoqUtDXAb5QGmsgPO0znP4rxKlHM4oCA3W2XXCNc3sXvfHeZpo?=
 =?iso-8859-1?Q?NqPaB4cyw2JmFHuOsN/HfDTHK+mYZOP5XilVIrReU/P6xqxkeDhi3c/ZDD?=
 =?iso-8859-1?Q?bJT6lH1zL3HzF2IqW4adg9l0IhHOWlaRiBaodEDyRMCPNbpvENTA7Gy36F?=
 =?iso-8859-1?Q?/XgSJJFX1cv0ahOVOufESsaL/zRQKPTtn/BC5/jifv+F37vU/xCjzwwEnJ?=
 =?iso-8859-1?Q?/2uinTE69mNHAABGmoxmLuEVa9YSHLmNMgQ80lW/MOXqo6IInnUd6IED9a?=
 =?iso-8859-1?Q?hBWV0cuhuI/q1T3pdnLRuV/gtkdc+dHPlkdF8UvGELTP2eJb1pRpM5pA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nkWyWomGnglUopd8rsb0BNdUwQyu5U+rQQ/HW3snvjYH1ajqGoTB9bMJz9fL1sQ++wYrKMtTEUVD3hZ367l8a2B3lT8rfAFIzKD9SMKp/LtjJvSb962S7iBrCSnZXz21Z4h5wIiwMy3gyTBdJCiaK2p80q4Bw6Khstr+zYOhK5i7YpyWGv8C0xFyfD/+MTxt9MavhU25BgbC0EO+uNmk/hhXrlb4UkqVMXuRRwXCHv5TrjyzrTBDFKYMtk6J5uqX0du4mHZ1SPpWTaEE9/TuJb4u9Eg0ytgTv1wb1ovmh/gkDEjh0fA8XRO7jBUP3IdqdfBrOlVkWhGDZOUQ3MDRD/3pyiAeqeCFSxYkvdX4u92nws6XWaGfLmcMT04sKB7Gdsh5yCC6QGdTJcGpwVJKal9yv9k7CrSF9Qd8AxShckWRZGLuvt/E7OXYvJmggwIqzc1BIS9CigXrnS7ycBejqyQy1Guks//0SxSsi3tAjp6LPG/BSKyZRYjUeVVOskJ5l9wztFHc0d7q10p0VTqo1GkidcaUDRkSKimTxuwYXbDKlXsbzw9z5CW6FbXk8uOU6WuM+8z5FkdcmWvnIJJH6lw+VDA/0pzH7ZWOhGf5ByI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15867065-db6a-43ea-3be1-08dd66f93f92
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 15:18:05.7355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9H3XstAvM4YIIyrFDelA6Uegd0dcByI1aQmH4p6FLsdSjGoHVsTHtEork9v0aRbTmLqXgO6SHCxtw5Skyz/bXjP8I996zpCWyMRfqo1tc04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF51A640DE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_05,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503190103
X-Proofpoint-GUID: 5iCHRaaWr9QgWfmg2Sv-kAq8Hw_FQMYZ
X-Proofpoint-ORIG-GUID: 5iCHRaaWr9QgWfmg2Sv-kAq8Hw_FQMYZ

On Wed, Mar 19, 2025 at 10:40:34AM -0400, Kris Van Hees via DTrace-devel wrote:
> On Wed, Feb 19, 2025 at 11:43:49PM -0500, eugene.loh@oracle.com wrote:
> > 
> > While one can access the BPF stack relative to %r9, the whole
> > point of DT_TRAMP_SP_SLOT(0) is to make trampoline code more
> > readable.  So use it.
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

Still applies but see below...

> > ---
> >  libdtrace/dt_prov_uprobe.c | 21 +++++++--------------
> >  1 file changed, 7 insertions(+), 14 deletions(-)
> > 
> > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > index 5d9f74244..f1323cc31 100644
> > --- a/libdtrace/dt_prov_uprobe.c
> > +++ b/libdtrace/dt_prov_uprobe.c
> > @@ -1015,22 +1015,15 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> >  
> >  	/*
> > -	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
> > -	 * will be used on the BPF stack:
> > -	 *
> > -	 *     offset                                       value
> > -	 *
> > -	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
> > -	 *
> > -	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
> > -	 *     ==
> > -	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
> > +	 * Look up in the BPF 'usdt_prids' map.  The key should fit into
> > +	 * trampoline stack slot 0.
> >  	 */
> > -	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
> > -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
> > +	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
> > +	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
> > +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + sizeof(pid_t), uprp->desc->id));

I get a compiler warning here:

libdtrace/dt_prov_uprobe.c: In function â?~trampolineâ?T:
include/bpf_asm.h:119:24: warning: overflow in conversion from â?~long unsigned intâ?T to â?~short intâ?T changes value from â?~18446744073709551524â?T to â?~-92â?T [-Woverflo]
  119 |                 .off = (ofs),                                           \
      |                        ^
libdtrace/dt_as.h:42:69: note: in definition of macro â?~emitleâ?T
   42 |                  dt_irnode_t *dip = dt_cg_node_alloc((lbl), (instr)); \
      |                                                              ^~~~~

libdtrace/dt_prov_uprobe.c:1013:9: note: in expansion of macro â?~emitâ?T
 1013 |         emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + sizeof(pid_t), uprp->desc->id));
      |         ^~~~
libdtrace/dt_prov_uprobe.c:1013:20: note: in expansion of macro â?~BPF_STORE_IMMâ?T
 1013 |         emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + sizeof(pid_t), uprp->desc->id));

You need a (int) cast for sizeof(pid_t) similar to the casts that were in
the code before.  I'll add it in as I merge.

> >  	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
> > -	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
> > -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
> > +	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> > +	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> >  	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> >  	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
> >  
> > -- 
> > 2.43.5
> > 
> > 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
