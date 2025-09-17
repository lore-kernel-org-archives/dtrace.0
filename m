Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895B61F9F70
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758121427; cv=fail; b=HHcI1yPcD1j5Lblw5UjdjHLpxIQuoinfFHl2xq86j8hprtrnUU+/u+XfNvTjbPWhbTy1QYSSkfM0hU+uLDe3O3mQ08/EOoJ5Lxlhf1cmivlDF4ZOPjllwvCK8HF9cyCIPEGnANztMjTngl4zduAuxLWlnEByOYSVB9JLkvpbKRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758121427; c=relaxed/simple;
	bh=+kltfeRQhaseH32/PWcjPdyw76LrwZi5mrhM/EOzv8A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=dM7JyYpW8Oyaqs+bPoVPvpt8/MGP6LTbdB9KHNkhNMEcy3q98Xo8Ojb9JcT5z1vB6JoCuZ8po+kxiATPDytL5qNXAKQP94eOBzNVevY7clauuEwCkmwZsrE9AntPUUajF2+mpYqPsyWg6CZyL/VGWVF84Z2Q/XNu/tO+HeBD314=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fA3Xpm3d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lmxztdRi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fA3Xpm3d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lmxztdRi"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HEISuN007341
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 15:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jXsz2C3DoRT2YXeaNl
	/NXoEZ8NDZ2mQun/07qSIwnbI=; b=fA3Xpm3dJqfvehmpfolxHuG6qrxjzvxvMC
	c2DkRNLMkREPalmQ/b0IUPKbTgVI/tAkX4C9gdkgXGvoGf+pbv1wwgy7/6Kkm9AZ
	46Y8XabR/KfDNFhTVAkg5feIGsjAAiTxMjOFn7++gU4jIIwiEJVwPuBG7iifCk4K
	Q5RI21ZI67gQ5ULGUFmSyRCMlAxcDtlOuDKq6chyneynSuffeRL24UA7LB4d/JIr
	gnZW6k12e+/Qeu5+eKf1KXBNrucgc6/qCsugDnISvqMIB/1+nnkRFEMy/Yjz42ao
	LeGXhwY4F6Vr6/sndVDcuS8vzSIKJ8dqPHwj1uvEmuiddBQZMa/Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx91f5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 15:03:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58HEeluq035313
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 15:03:43 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2m6x54-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 15:03:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSExCoyFGom0ZauN/PnGruDymLvM+ChKOVpunEFPrp1jxNqgr8I3CCRLE8Qv6vkigaS6R5LxvOFUJulKOBNMC25Ezw+BhdzgxwJMnPujgDh/0tAszo+rtNIoxAbZDctPk/3nnbs7+8mAC7Ml5E+OIbIkDNZmGCfmG93AuVW+frn9VcKiKDr+SmWk7CKqAZNqI7VNTdkJ6SrrVJQ+9II+74zuCq39W+rvcZimhnwvNWXALnIvHsdBo9i33VPsamWwiG5IB3Lfs4zWaM0dMzTstXPvA+qQP4EiGc4y4O9gGCouSS7CQ7lh6yKV8pZeJcG+F5D6w4mOyzJwkXuIW1pWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXsz2C3DoRT2YXeaNl/NXoEZ8NDZ2mQun/07qSIwnbI=;
 b=XucdF0uYjjXwGJmOkvGPWT0gnM15oJyCz2Y9XqMf/A+eft0LGfXS21bl6+fiUuqaCTfy7AQzMecylxbq/wZwjvWFwIeYXE3f5jIgBsfmcFBLX/agWAVbeAYdOyVnX37kZgCKNgXqu15CjFdeL4tZdqqmZPSHfR7/MGSlsQpL96Cfj8pFBYus4G0sIc2nVLnsRssiHSLz61wiKZzFKpq+5zXfD8Y0NmmfW6NmkmzzspBLoA1sEmiCYO/fpKU2cuHdf1tBSeFZSHi9aq3TpKFF71BvLzp7Hu9vwMy3OJh3wucgDguXg7AfTl+TeDFqNwGqGJx+ebSD/rE1ww1fdiCiig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXsz2C3DoRT2YXeaNl/NXoEZ8NDZ2mQun/07qSIwnbI=;
 b=lmxztdRidz57boCO5PMea0+1rUuxtK5NzjbOo4A+rG0m8wI/y8stcNyC68hUbTbjELGM4s/Y3gR93Kn8XeU+iZ3pxl0dhyRDRpOiMsE3c4Vpv547TwETila0AONQgBBE+u6wynLZiJmBVlNQHpygf9gZ4SJiEMtB//R8nhr4Dbo=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by CY8PR10MB6514.namprd10.prod.outlook.com
 (2603:10b6:930:5e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Wed, 17 Sep
 2025 15:03:36 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9094.021; Wed, 17 Sep 2025
 15:03:36 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4] trace: print alloca pointers as actual pointer values
References: <SJ0PR10MB56721752C4BEB7A65080065EC214A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: it's not slow --- it's stately.
Date: Wed, 17 Sep 2025 16:03:33 +0100
In-Reply-To: <SJ0PR10MB56721752C4BEB7A65080065EC214A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Tue, 16 Sep 2025 14:26:45 -0400")
Message-ID: <87h5x1p1dm.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::20) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|CY8PR10MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d59abb-fa0e-4a36-1dc6-08ddf5fb6032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RHrqEKEcdOv14OXsf0MkbCzfY5npxWFeNkLLza2eINZaYGac5GOqB1OHxvps?=
 =?us-ascii?Q?xQ8sfcjFcEKem//MAZ5ngOgFNbi5ACLsZj3mF7BqbyJQ4G9dGQpKfg/DQ2ki?=
 =?us-ascii?Q?YSrJQDClGy4Cyk1DB8BwWMfTT4gdETK6lWGzMoVTwruUjmMVpPQvajnfJvuu?=
 =?us-ascii?Q?GMQpf73M6GC0tguMFkgoXuaIFnsP74UNloFiEsMAWl3bgDhiG/C1qfwZfQJi?=
 =?us-ascii?Q?8/XQW6NJTfi8bKAJT40k3jwEK3stNtrHYSY3A7wSJymqFFP7RqoWt/yvTWi9?=
 =?us-ascii?Q?l81yqDpzIxgI13ssDd+dGrzQwmRpf+i2XutwyYcLiNHKIsavUzfMZmLQL3UM?=
 =?us-ascii?Q?vBX4ySBrafK05egmT8xyYjA7YR8RYZeq5hKMuT2pKWTyPF7b0BOVoe/QIBD5?=
 =?us-ascii?Q?NsdRoqzQwERqSItfgdIlTnA5otO6tFtT2CiQJ/n8TpVgcpgDncUwFbhDD1kW?=
 =?us-ascii?Q?xZp1KMOoSeIzl2HvunYtKvEnMRjnw+zS2ZabzKP+b72ogOPd1pKcCwR6nbj1?=
 =?us-ascii?Q?iwBY09bXCH3Iuh/u1BPsQKixGRo9x0X//BxW4dBPdlFFWBIbdFx+MWHbOny4?=
 =?us-ascii?Q?ffSAFNum+mtET+INA845WYdioe8V/Cn4MlJhQj/rcXG5NyBOUmbEkoEtRZYe?=
 =?us-ascii?Q?Wvj8Vch6prCskqNundniChCCNr8yjMh5TWT6rYOwTZNN5VntdT5Gc3Ty2Rjr?=
 =?us-ascii?Q?CvGdovFJqAltUj1fvx9yknEnTPdPjTJ8XBl3EguqGje5NLm7ag4FPMOKchOG?=
 =?us-ascii?Q?4j6s319XbydVJd2pz07QHJTIZN7OrIWwgQDCILZRGJEnFNqCcLq6K8uMYc7X?=
 =?us-ascii?Q?va5hdVPNESSKaL8fn3rHATy+kp78wB1c+1dpL9ZjrxOyb+2+MmR/85cTZoJH?=
 =?us-ascii?Q?pShASH4zwe0RLcgEoou/eU8LC+pisAGJSEolsuwduRn5eNA6eWUxJpv0ASHv?=
 =?us-ascii?Q?s6NQUslbrAaZYdNHDjH79XseyncpytRA5rTcHBERuyPe4sqs0fkpcj5caGYy?=
 =?us-ascii?Q?5UHawZ6JXXvDaTmoR+HE2q9JLDHVLt3D8oVmPhum1KvaiIUewyMvkQkmczRr?=
 =?us-ascii?Q?Vq3hg0fWKkUx7K1LDaWiRAFkqToHMcnKKfB0689v2Q3BRVdXbgwc7ak3QhsJ?=
 =?us-ascii?Q?cSYc2wUpNsDUejb1n6ZQTXCkXJOJHetHlcOdFues2ziwnNdb7PDsTmjOZlrL?=
 =?us-ascii?Q?511XLzHugbjh5GIBrn3FwaFhtCkegToXEAlVD+zm8ptRv1DQiC44wwP3oyB+?=
 =?us-ascii?Q?oVBjTLHIi1dflj2MLZTzqUs0GjGiZRorEJtzHZXjPmMxzJYtlG6Pfowqr6vX?=
 =?us-ascii?Q?jeQ/L/rdApqiTOwptuuPCNuMAYjAQSjwvc1RbAj9eIWMPTC0ncks42tndGai?=
 =?us-ascii?Q?pPWWskK69MLGXAOQkXwWH21GDFXFG8AJOPnBkjFJjmBLO9dDElDGL7iQTmbq?=
 =?us-ascii?Q?oF0NLnXZN7U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GHhTIiYUZktMINS6HJBjdZA442w75GYE3yHYl4vtqLBWdSkOVnWlwXx7VFTc?=
 =?us-ascii?Q?80vx8+ARG2n77pPHxgzREX0avVCw20qzGmGkjtezf82MRAfhVDFp8yuv2FDb?=
 =?us-ascii?Q?fQFLoy7c4ZA0HzF1Q1ugBA6LvgMZd7Ql81L5JLlwwGtE0eNnG3nHNgUr6ruy?=
 =?us-ascii?Q?Fd/eL4+Nab6ebG8uckOpbjI14mP0hwcfmiYZ7p51MkXRdPIY0Oez/pCMkzOb?=
 =?us-ascii?Q?+yUpP1CftAfHZoiKdMeV5J4hyWe2mSKjAvRF3pc854kImm8PwYO07KL8fSTg?=
 =?us-ascii?Q?zIlX5+/UC8gTbLS7uYKMLKsFSxELVTzRlJHSPanZ2ptxErOPPKlhwGvAAERe?=
 =?us-ascii?Q?C72rO+jRIfeNcrFi1AGmEiME/zBSTPBrN0qMW0eIm9gfKPx36G4gGtiXeGrC?=
 =?us-ascii?Q?moGKjS7YJjU52XhWiumYlpW20P54DhQWs052jNCKOfkUvHjDsVnQQYr5Qd/F?=
 =?us-ascii?Q?Td/n1CsrM8X5wqwuBNWOgGfDvWx1k3QLVWx+pOThuzUFtI71kkwzLwkmJ32V?=
 =?us-ascii?Q?6QTUsGFvrF8jjbmnzNcXUkV+Lbi1pH+cUfpGjsO5RdC1TVCDtdGwqMRBB3GN?=
 =?us-ascii?Q?2m8PPEDAUtGVth8cKUhBXrr7CThhfDwxJUtPeCPej42ocrnLiL14INm9krew?=
 =?us-ascii?Q?vho9KGKiLHOMeZeeZtikYkJvbJ9jaTADRxAdrpljZF9b9Ga8kaMu8khng7Nn?=
 =?us-ascii?Q?HXcSPNjcv5DF0RIwuNzv5sHNt/xI3ClEXDUdIKtiQryVIiyuY/iEhR138/Xq?=
 =?us-ascii?Q?THxMzt000TLitoHW3OIBuc4B9x4ZDRMCTJ5B2ccCZnvqU3Rk1biYxV/9ps1L?=
 =?us-ascii?Q?yk4LKwZJBQCcn49JRj+5z4fOMJgSLsvxWp6ZlpIz594rP6ww+0VjYZrooQf3?=
 =?us-ascii?Q?rr000BpAr3B932ttBwZ2wiGLtBureI3LrkNjWmi8nfLz8Xmq3jYfzmFevcHk?=
 =?us-ascii?Q?qGd+YbjlD0JQlkUmucd9lWuyujLLJdZSrNDqmaGeHcJmo1TIK2Mc4BkyRvpj?=
 =?us-ascii?Q?01LOIHgfaeYHCNuBDjZ+cSAIK3DDact9Yym9KcZ/Z55y7eomRWXNDFQ5J/rP?=
 =?us-ascii?Q?daijwmBazGQ+ft8TOeNBB543WO5r3Mab9+hy2l8WUWHEBBUMruzo6Ch0JtPa?=
 =?us-ascii?Q?UocLAPWNSNuS+Hyc0gX7DjkhiOc3izs5pk2y0Lxpwn05n2Fm5gYtufMaFC+E?=
 =?us-ascii?Q?B5o+axvpaTFMlsIWms7pLxwSzqfqTobDc54HRnqu58vhJFhIWnLN5s35rPxL?=
 =?us-ascii?Q?JQZiJ2NvS9W424YTsmfkWBb9EItxoHnE3M8369eKPjaiz1DD0LbfxlZ+TDRV?=
 =?us-ascii?Q?bgYIc+ASkHrkq0suXz/HngnDkkTOv1/qwW74au1KQaTwOwnPBJj8ibh5jAFc?=
 =?us-ascii?Q?UBwUKBIdmPrd8XkbzB35XjKoNsnAo9mOFBBORJxrs1WjSWTBE1JepkjIXfyU?=
 =?us-ascii?Q?q8niH8FSvMCIbcM+6+TUw2DJ83rr5OwWn3AlHVLQCVZ+hTdsSN9xq7ek0mvi?=
 =?us-ascii?Q?6A4iAxDPx6YRGISujKiV6LQ8jK2LXTv27ba5wYaZrgXxCdQbU1LjBYHHB/p5?=
 =?us-ascii?Q?aJl5lrczQw5SuPTh0Wl/KR6adZD/9zJXIR0ZOsqrTCY/LgENQi1uCrTK45Fz?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z1tmiIbWUe0kv/8bgzCb7qI5HC5k2JiwPFKUGl+ZO20EiT4rnbf/l3U5Ie+AMfPW6Q3bnqdzPR7wHPc9RxaEAF5WEoVkkLzstZ9pxXERZPvtiW+nRArvFkvCdMPQXDXBdxAOI+hDkIZdChgY+WmpTQGYARqTra4QGecwmFbHUYqIrx2/88WFPxBuip97IQhTSQOSdEjFDKNbKieNnM5h+nI/FwkW9jdHzFPHnr9lLTToZi44khV+I5EtbChTtuKw119YuWh4y8p5SwUw9l/0a9ejxN/RMVwo0HnLo4sxBfkRDtfuCKnVXQIA7RE4lX3TW8GEQz7mWccCcI1cy9NmoomW7boeK/sFEBTXX4r6a3rsWJbN8Ne5BmgJ8XX8HilqlqKs6V/HQh5M3OEJ20RZSts+kyz6nJN44RHYSvFnav+Q77TtMIcdne34cq8MsUCnl6zWg6Ya7aI7ym2FjrAttHg9WQ96uUxA19eT3khORFtMJpBGiiwkxbjZNPilcBLXxS2PkTtbTsMg+nnuwQtJTr0RcJhGkcn1Qvv1qdQBINh3zR+acP7y9mRVO+qQiGdz8osxecEIN1cN19rfZVWGAgEWdWNNgAEduOlQhBmwtCk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d59abb-fa0e-4a36-1dc6-08ddf5fb6032
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 15:03:36.0722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9D/rDmZIna0b7YzU9GUUgIUG+hKtvjvV+zDJTNhqCYxa7iiLH0HkWfxrkbucBKosedXirmFxc2dl73efVhcUTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=953 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509170146
X-Proofpoint-ORIG-GUID: eVGPRFheVMu54qycXqX3TR07RmI87SVX
X-Proofpoint-GUID: eVGPRFheVMu54qycXqX3TR07RmI87SVX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9jqJrUmBBPMx
 JJ/xAo90Ga8xa+l5PUKtLoCwzcMVZOEPf/Kicgvb2jhotODYqYNcEhytUJkrU/8OCDE94V0HilZ
 TFmp/q4ArdOF+50++HFSuBcu9oSPmsuo2RFw3/X80CE5ihjme3d5SIZojO0IKAz35V096oUfPQj
 vMaZZR3XGzvjj7rdP4HIUXBt9fy9IGa4st+1GnLleHFBqmf6ZcvNhkPDmfstC6Vl+Uf0jhnJzeK
 HIcpsJtb3oSfEmaLJ9+Q9++aQH0/al3ATM9SFTRzxowA/03dOD1h+MEIUcT16ZPLRwQtd+4WLJD
 dXH6fM4LMpDV4fJ53pOLX8yLfbIGTkafwK39Z5Gyz8/WgvAR/u1THhCCivGvUh9b8KJWEFEVDvB
 CCwG61tvpbRnB5Jb8XX4IpL5s7HWbQ==
X-Authority-Analysis: v=2.4 cv=N/QpF39B c=1 sm=1 tr=0 ts=68cacdd0 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=p6qNWW5_kgcrVogxncAA:9 cc=ntf
 awl=host:13614

On 16 Sep 2025, Kris Van Hees verbalised:

> Because alloca pointers are stored internally as offsets into the
> scratchmem area, they were printed as small integers.  They are
> now printed as actual pointer values into kernel space.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

So... the change is to generate real pointers for children of alloca
nodes too, and scalarize more aggressively? I don't really see what the
second part has to do with this change (and more specifically why it
didn't cause problems before now).

-- 
NULL && (void)
