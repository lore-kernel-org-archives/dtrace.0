Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE383FD1
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740026640; cv=fail; b=aEUK7xf2PLXOGNBTwALTPgmA5zcWObP0sec3hiypqsf994DrlBzRICLpbr6apX/J/Ob8u+Za27R7sZc5VoN2NPeKL2s7bKNc9z055RYTiWsIW7ThKY77aQ5Tngel62i1tbA/bImx3OI8/wWJvRrY+oZQNVzEsruDyLMqaId9mwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740026640; c=relaxed/simple;
	bh=c9H0/dBpsetT+989MtkD4J6dgq+ANEtStF5Ho1YBiFM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oLr18aUi3z3ATYhW3dmYlnibRjYfNBoGQ+EYsYIfL/mtTIEG50P38RFvqdrKlfONoZPoCTEqo2gdE4/ZyTAcbZ3/5EPL7cnmusNYb1dxcCM+PlYfVOHQAYOIYHCSTgSsePSE7CF7sr5D+8JwdkdpTjl8phNJ+Y1h90+PB74DfvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NqZgD8ge; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vj1SUxY2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NqZgD8ge";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vj1SUxY2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JMZXAw031069
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 04:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=c3HGJG3Ec9C9f/D0if
	q+iXJIabH/qM4LLdvqluo4wVk=; b=NqZgD8geQb/x6gNJh8WbfhidtJYtbUU7+I
	Y8pvj/WG/7sy2XU3FnZUPmQOpWlHAws3dPs6IUFRik7+DyoyYaYfWKQkYzzBR7li
	TEIVJgM1gjDDmxs/lkSFlA2fkFBNmxzishtCZYWvhK6/iyrfJRndXgKLMWbZ0Ujk
	FC1ptuUFNaommbYiMC8pGVhLVj4gd9/YDhAQe+77dFSoaHVYfCqLut0TtoAh+uAz
	DQMQngI+fOYdwP06KRXpWFVpXHzP50cxLTgu2VxRteOL9TftHVWodbs409VPmp0u
	Ve99JxV4px230pU61zVIceD7Tcq6KrkD3f6sVtCFJNi5XGym9sdw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w00m3dyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 04:43:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51K2PWZT002107
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 04:43:56 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44w0tmn4kc-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 04:43:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtQjSiTpoOtUZsIYEMg/SiicY7cX30yFHx/SkD/UXx3GhsohzJlhwtRFvpl5B0iXgsYGpRC+ECJRnbMIp4f5ZUvOp499zCE5QLsjiDA3Nhn+oxET0wJCaqMfVPIrFaOfOpbl2t/wbeN6gE5PEg+71gel7CZjZY/9F9Tu7g0NlUQbRIGKWsg11q4IGBB1DGjFxFWUQUh/lMZ6XTnSpOHIyLqDcc0JFu4YkevbZPq0d6eck8ESsOSYqXbK3KlbpqacoJnY1DWQSQPHKaQjhoC9swz9zxCw5srOMhg0BTg3Ml7OeiQKiFECjT4GtiqiIYULr+iM034j1R/5ad1CDIWM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3HGJG3Ec9C9f/D0ifq+iXJIabH/qM4LLdvqluo4wVk=;
 b=tJ+DpnOT/liRn50RaxA9GXjz8oR5wrrA8+aQeChHcl8mK3pTlWBPYa7g4T0NAqstCRe5d/zWn1kwO7Vo9CbmuS49MLGOjNcXx2xIK3ombDJfFHenjiIpCFnyJ6JpMFv8a51W8vdMGcmkSsd23dSfT19Oq6jdnnJ6s9sr7N23iFhMI1G07FAp7UktGqd50U+d5p8P/sT2syuuMXyynUMJ8LMQ5Ajh/H3N0hSLlpbxo/3JxYXL7sZ9KvXPlYkwflazOmelc8cTbhfw0HELoKcKJH30oroQ06E7fA0SVLeNhQt0QxAz9WCS1O20mnteN8w5HRNnC/8xD59d3LmV7i5g9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3HGJG3Ec9C9f/D0ifq+iXJIabH/qM4LLdvqluo4wVk=;
 b=vj1SUxY2CItGKPho2aWtzkihiIH4qh/3hG75GcvsvRhrab8Uwf19/3H2Z5X0MzRRj2PODlZJlzKq6XPqTmgJTn4MvADLSy8yeb6fOLDKoi31X6G6LgD/YZXpWmV8hIUMdhiY8PoTvgLXNkF5eUf+vElIv7ckESA0W1EVpoQEyVw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7084.namprd10.prod.outlook.com (2603:10b6:a03:4c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 04:43:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 04:43:53 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] Extend the USDT bit mask to multiple words
Date: Wed, 19 Feb 2025 23:43:50 -0500
Message-Id: <20250220044350.14953-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250220044350.14953-1-eugene.loh@oracle.com>
References: <20250220044350.14953-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 15aa62fe-4d87-4c6f-103d-08dd51692dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j4LelCuiyGHiLqSaWfK2aM2NEJid5GmJzyPeRkQXq+F225Rvfv/JOUmrdddr?=
 =?us-ascii?Q?m0Zm7LAkJyELGc41g5CsY82chosdu00fKEiQhbuPODO7mWaP8Fv+zdrNvJSu?=
 =?us-ascii?Q?DBrKBgYOaRTn8C8RRjNwoSfXXGFOwoOebvT44Gn1iTKlMdViyl9J9hYn4B7v?=
 =?us-ascii?Q?pvus4vuXelHpkgQuwqrwUtH537W1FYYsS3zgAQON/lxgrz5rCAo4LHHtrvSi?=
 =?us-ascii?Q?5rkv0fe1LqMjX3JNCUZF/HSkE2VB+vjiRhlogvsne6j0a//wBubwUG7Sefwq?=
 =?us-ascii?Q?+7PWhRwDz1HBqaHEt//6M2d+Px/3nzBMLFgIlOtne6QiTqdIHZsBs0ziAoJT?=
 =?us-ascii?Q?E+7RIw7MzojganlXi9kl1+N3Sv2NCd8ayxoNLiLK3AQijNqnoJkygQSWx+Dv?=
 =?us-ascii?Q?9lU54PK2FL+Gg3yVD46bK5HqMoQga9RWHuvZiyIyDnQu7Ybr9ziDHEC/gLeg?=
 =?us-ascii?Q?8RA0MWL32XJBm+ugu4DC8LQZV3iuGfmN55s8MxsDlfLjjCXVe+nX2l5KypAj?=
 =?us-ascii?Q?yHaC9pFDJ747lDsuvTbS20d9Q+wMhH0l2sMCiAp30XAnyzcXzmcJK2PvBXfN?=
 =?us-ascii?Q?BH5au+uC1nv3DtextOtFdBpz2cc7yBItmmYBPJpM0oUIMdGLlYJpprJ4ZzNp?=
 =?us-ascii?Q?8qpwe1JRQjfmH9GoZ1t3QJiimmEOClVRS9ieCkGcwLjdU3Ur/96Z1sQghMQI?=
 =?us-ascii?Q?quRYrrzeIvRnMqgnx5PGIfyF9KRT6tR2y5Kk0r/l5cO0KgZlhhRs//Yt+VeQ?=
 =?us-ascii?Q?3Y63CWKno5a9vXUFQj9eRrklA0g8Yj58jrZ8HYzzvXTinb6dvSo6MngLUJJW?=
 =?us-ascii?Q?hRuczpuEkktQOQIHvNzI69k2J1RAVQx6zoYF3m/B1MjUb0l0F9/DU9EvXOzi?=
 =?us-ascii?Q?G8Dc3qMliK+Vv6YRuBHmqn8aLRJ6Ob9ojaAsDjYAi5vmEoOdlx6gHCmHdCyJ?=
 =?us-ascii?Q?qdSTS97V5hOarXm5C6ezVziTXX8EyYVdq8Nd/psBMtPUadGJ3c/ZNUQ2GZdU?=
 =?us-ascii?Q?uZqRGJg87UrOM+IYUdF4z1DFnbtYn8Be1ZAXT74pt9iSgH24BYYlyrjIsyzf?=
 =?us-ascii?Q?9IeOKPLyy85dDayPfghH4WUI8MV8/nIWhQ0vevdFXiOpJM+Y/EV5Whbq87PF?=
 =?us-ascii?Q?NDxn1hd0ipNo0K8GHH4SQ3u3yosyLWfkKYtoQn0MmB1bT+h7v1GhlJYN7obW?=
 =?us-ascii?Q?ILIHHOUESAZ/G5dhEkPtfSO0hH6EWPbb7cIMvUpIKzIvANSx5WnNZI+M4TgR?=
 =?us-ascii?Q?jRuM5aJkmzo8axfvnvMjqAAbnmkFw3uL+KYX+xbd5rwTqtJpngjNpn96jH0/?=
 =?us-ascii?Q?KibIKqi9uxUEfcxHugyFUfz1os8lAlwIzvrzUUZfBaXcGg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hdXwYO7s2ImNFRtkdIr7gvs7dTlGnVO8HCg1ATe+UY3boJSCdsndZcXgr5Q0?=
 =?us-ascii?Q?S3mBd29dnYgKPTwH6Ac1A7BBxEcO6DnhC8MFSr04r3vk8h/qEFG1xNGCkg2z?=
 =?us-ascii?Q?/fcqav9MMDtOJpGwlhNaUCkXMwabG6VppqkSczMPUYZXgiJZKQ7u6Ktaxv/l?=
 =?us-ascii?Q?7UxgSJPw6rLtMAIYG6tT4714zuLVk/R0ozBp+B8ZN+0jM0frvsKOp6awYR8g?=
 =?us-ascii?Q?JZn7XmaTic6uqoBaH8qme0ctn0O4teKBI20PJSfUW71LuHZv2iUVixOR0Vr8?=
 =?us-ascii?Q?wpPtTxIdAKEFvJrpvB/5Jn6fu/eVQfeRCOBpl2qGkdjyNnJFZeAPe4TeHIlr?=
 =?us-ascii?Q?13ins8lU5K+/ww72JyviZzu7yWhdoFS3Ux/F+nrTAwUj0deshZfzYJfDx/S9?=
 =?us-ascii?Q?ntOi9wuO/tEU2fa++FXKD8k8/feBgQSAF5yeKg3B/Qsi0TylJdYqYjnpXXZi?=
 =?us-ascii?Q?kZR8xfSrolCJR3KmfJZx323bWEFVETaxxEjKcJPm/aVWrFRom4pUvBkkXO0B?=
 =?us-ascii?Q?9YybxHUj+gRU2m4Et+ivE3IC3vqsBlM1ejmX0RUY7L7AsKrqL+Ap+X3r8WRq?=
 =?us-ascii?Q?v6YaxkXp94q8NDuQe5IHacNZrkpF0jIPwINAdv6O2iouETa8O51bVoUivLs+?=
 =?us-ascii?Q?yV02FW6Ob6jcCXw+MKB3XQTDkyUjdU1gP438Jj3HYPFYE7zosZkIuBaY7wNP?=
 =?us-ascii?Q?5DfLXdIgvuAkdoptSOY238pOX/Zz3YZpFqu9t+UBOw8l4Wg5SxjJrBBDEjzG?=
 =?us-ascii?Q?ut2zNb/UGJ/IgVwk2QVJzSySER4ty3c70fzr7nn5hzzDa69UyyMqesNevtbC?=
 =?us-ascii?Q?6YF8fNp2aY1f/+v4IiaJl0qYWCplubhGWuAh5Gp+xPWO338OYVscuCBjnzaq?=
 =?us-ascii?Q?0Yt5oHcslBcNZtGmwh38BUOahS72ZiL0isAW56UbIKzi9Eqxxb+WOczuDzSy?=
 =?us-ascii?Q?ptrE4qmICOQReDX5yGTQvvZxhdZR8zIruxLbotzFj3pLxQfQVvmy0L1DBbXZ?=
 =?us-ascii?Q?WJAA23KmvlkryLkpNWE2CK4/Fw1MoW+fTckyy3MILGmeG5EvNBdqP319ldef?=
 =?us-ascii?Q?P3JYuoIZ2uwaCd0BOinbekkaC0p90tB4NKroeNMITOvHJWX4WDRXb8hZlZOb?=
 =?us-ascii?Q?xd5m6B8ZB6PDaTx8A5ADEmA+d5vJ7Ky3El6Tm1yr3D4+85JFfUnlA/vQwefT?=
 =?us-ascii?Q?badfdI+0hNTt9nir/3AWVzI+4TS2SPznapdJnnSTfFoQELy2BxVzs7HR2HWL?=
 =?us-ascii?Q?HgrlZHaKfUTymbT7CJe9PbxH42Pd9eNwcUbswyND2DQs/MATDmbee/WmTrT3?=
 =?us-ascii?Q?/w1El+kOdlQ31sVPViCsav+wZJmHJW/YPkQZS8a0JsFTEVmj5sBk6mqpBAyB?=
 =?us-ascii?Q?pKKm3l7ALJuAxFlHkxrdczcgyUmQrlI1jED0TDO4JjUx8F1fYs+TrcIy4AQw?=
 =?us-ascii?Q?hiGrqGwLHaoUIPyTcbuHwcIpTyv0y3N0z7z0AEtDdqZ5EpXqi/9490t+zPUn?=
 =?us-ascii?Q?mrdMTxIjt1a9tvNGZAFpituQuq3cvPhenxnQE/o96awJpQyh07HEOTZx/6GK?=
 =?us-ascii?Q?VOyGV8SFUaHS2Uy0gjjU5CF/0zeBkTfpox8GfAoy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+p2tWZIN+SFXKOJISVNFK6Gm8V/pPdB/wI1DIucMQAdvAQC0RbQ0yFVtdsSTHNUmXaYmfb4bWpzf3yMt8FWeeRZ1ohbAiivvKD62QgB3q9f4l/VBKoGXgYR5InCufBzAu753jys9K0LYwY3REjWpFQONB0Chxzh3AcnNImZMQU6+bYBj7lMKQ+DOcUJjQ4ZKDIFbLE1vfAiypAEd5HB3AWacBukGjqxWx0agtKOAlp9/XAX48gXTfl2/YIRyhXyrZ8IF5w6LchSTbOQpwemeHtvw7J+VzaTUIqNL6y4FUeampWHYk2LWiV/g9fFS6TAoMvSD6M+o5lZaZvBm9V9LY3HZmVysevTRilfg/jkBPU04vc8Hlv8nDmK/Ack2gZy5BUTYNNHQj2f+QDrUuGVisem4tkoCYOrTmc831EBqaadfQuiUDa2/uazUx6uVBzB2l9x6Amwcn51SSetu/2txfR5NxyPY+9oQIqUB4J6s8o/9cZAjeRuoMdBDpn96KYncL65DL4g+euQuH1yNfoJe1KzL/5wz98/q1hXNy91Zvba1xA9TpxFI6owpg7nk5SgaAKH9SjY4DZiWv9WJDxk0aOHX/q2zuNTTfLxjAU0W74s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15aa62fe-4d87-4c6f-103d-08dd51692dba
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 04:43:53.8917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zG99ke3P+1tSTHUK9CVwstALdMsZ1W2/B7tiXpEDg81fYaJc2Zhs8zrWAGABa5lb6fAy2Vl10vA/H9PDBZNScw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7084
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502200030
X-Proofpoint-ORIG-GUID: IgXos4OcrzfZ49W5EBndMPSQ-yu66RPd
X-Proofpoint-GUID: IgXos4OcrzfZ49W5EBndMPSQ-yu66RPd

From: Eugene Loh <eugene.loh@oracle.com>

Currently, USDT is limited to 64 probe descriptions since the
underlying probe uses a 64-bit mask to decide which probes to execute.

Change to a multi-word bit mask that can be extended to however many
probe descriptions there are.

Also, change the mask words to be 32-bit rather than 64-bit.  The reason
is that, commonly, there will be fewer than 32 probe descriptions.  In
this case, we shorten the value of the "USDT prids" BPF map from 16 bytes
        uint32_t        prid;
        long long       mask[1];
down to 8 bytes
        uint32_t        prid;
        uint32_t        mask[1];
(The second member is smaller and no longer costs extra padding.)

We also add an
        extern int usdt_prids_map_val_extra_bytes;
to denote how many extra bytes will be needed for the extended mask.
This value is computed by usdt_prids_map_val_extra_bytes_init().
Currently, this function is awkwardly called in gmap_create_usdt(),
just before the value is needed.  Such a call to a provider-specific
function is clumsy, but there are no other calls to the provider
between compilation (where the number of statements is determined)
and this map creation.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c                            |   6 +-
 libdtrace/dt_bpf_maps.h                       |   3 +-
 libdtrace/dt_prov_uprobe.c                    |  81 ++++++++---
 .../usdt/tst.many_probe_descriptions.r        |   1 +
 .../usdt/tst.many_probe_descriptions.sh       |  64 +++++++++
 .../usdt/tst.many_probe_descriptions2.r       |   1 +
 .../usdt/tst.many_probe_descriptions2.sh      | 127 ++++++++++++++++++
 7 files changed, 260 insertions(+), 23 deletions(-)
 create mode 100644 test/unittest/usdt/tst.many_probe_descriptions.r
 create mode 100755 test/unittest/usdt/tst.many_probe_descriptions.sh
 create mode 100644 test/unittest/usdt/tst.many_probe_descriptions2.r
 create mode 100755 test/unittest/usdt/tst.many_probe_descriptions2.sh

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 662fd81a4..1ed9376ea 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -940,6 +940,7 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+void usdt_prids_map_val_extra_bytes_init(dtrace_hdl_t *dtp);
 /*
  * Create the 'usdt_names' and 'usdt_prids' BPF maps.
  *
@@ -965,8 +966,11 @@ gmap_create_usdt(dtrace_hdl_t *dtp)
 	if (dtp->dt_usdt_namesmap_fd == -1)
 		return -1;
 
+	usdt_prids_map_val_extra_bytes_init(dtp);
+
 	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
-	    sizeof(usdt_prids_map_key_t), sizeof(usdt_prids_map_val_t), nusdtprobes);
+	    sizeof(usdt_prids_map_key_t),
+	    sizeof(usdt_prids_map_val_t) + usdt_prids_map_val_extra_bytes, nusdtprobes);
 	if (dtp->dt_usdt_pridsmap_fd == -1)
 		return -1;
 
diff --git a/libdtrace/dt_bpf_maps.h b/libdtrace/dt_bpf_maps.h
index 884dc3983..ba17d8942 100644
--- a/libdtrace/dt_bpf_maps.h
+++ b/libdtrace/dt_bpf_maps.h
@@ -48,8 +48,9 @@ typedef struct usdt_prids_map_key {
 } usdt_prids_map_key_t;
 typedef struct usdt_prids_map_val {
 	uint32_t	prid;		/* should be dtrace_id_t, sys/dtrace_types.h */
-	long long	mask;
+	uint32_t	mask[1];
 } usdt_prids_map_val_t;
+extern int usdt_prids_map_val_extra_bytes;
 
 #ifdef  __cplusplus
 }
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index f1323cc31..2a5b0ce91 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -76,6 +76,8 @@ typedef struct list_key {
 	usdt_prids_map_key_t	key;
 } list_key_t;
 
+int usdt_prids_map_val_extra_bytes;
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -175,7 +177,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 	int			fdprids = dtp->dt_usdt_pridsmap_fd;
 	int			fdnames = dtp->dt_usdt_namesmap_fd;
 	usdt_prids_map_key_t	key, nxt;
-	usdt_prids_map_val_t	val;
+	usdt_prids_map_val_t	*val = alloca(sizeof(usdt_prids_map_val_t) + usdt_prids_map_val_extra_bytes);
 	list_key_t		keys_to_delete, *elem, *elem_next;
 	dt_probe_t		*prp, *prp_next;
 
@@ -190,7 +192,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
 		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
 
-		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
+		if (dt_bpf_map_lookup(fdprids, &key, val) == -1)
 			return dt_set_errno(dtp, EDT_BPF);
 
 		/* Check if the process is still running. */
@@ -203,7 +205,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 			 * we might delete the same usdt_names entry
 			 * multiple times.  That's okay.
 			 */
-			dt_bpf_map_delete(fdnames, &val.prid);
+			dt_bpf_map_delete(fdnames, &val->prid);
 
 			/*
 			 * Delete the usdt_prids entry.
@@ -224,7 +226,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 		 * FIXME.  There might be another case, where the process
 		 * is still running, but some of its USDT probes are gone?
 		 * So maybe we have to check for the existence of one of
-		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
+		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val->prid]->desc;
 		 *     char *prv = ...pdp->prv minus the numerial part;
 		 *
 		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
@@ -346,6 +348,33 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	return 0;
 }
 
+void usdt_prids_map_val_extra_bytes_init(dtrace_hdl_t *dtp) {
+	int i, n = 0, w = sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
+
+	/* Count how many statements cannot be ignored, regardless of uprp. */
+	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
+		dtrace_stmtdesc_t *stp;
+
+		stp = dtp->dt_stmts[i];
+		if (stp == NULL || ignore_clause(dtp, i, NULL))
+			continue;
+
+		n++;
+	}
+
+	/* Determine how many bytes are needed for this many bits. */
+	n = (n + CHAR_BIT - 1) / CHAR_BIT;
+
+	/* Determine how many words are needed for this many bytes. */
+	n = (n + w - 1) / w;
+
+	/* Determine how many extra bytes are needed. */
+	if (n > 1)
+		usdt_prids_map_val_extra_bytes = (n - 1) * w;
+	else
+		usdt_prids_map_val_extra_bytes = 0;
+}
+
 static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 {
 	dtrace_difo_t   *dp;
@@ -416,6 +445,7 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	int				fd = dtp->dt_usdt_namesmap_fd;
 	pid_t				pid;
 	list_probe_t			*pup;
+	usdt_prids_map_val_t		*val;
 
 	/* Add probe name elements to usdt_names map. */
 	p = probnam;
@@ -451,11 +481,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	}
 
 	/* Add prid and bit mask to usdt_prids map. */
+	val = alloca(sizeof(usdt_prids_map_val_t) + usdt_prids_map_val_extra_bytes);
 	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
 		dt_probe_t		*uprp = pup->probe;
-		long long		mask = 0, bit = 1;
+		uint32_t		iword = 0, mask = 0, bit = 1;
 		usdt_prids_map_key_t	key;
-		usdt_prids_map_val_t	val;
 		dt_uprobe_t		*upp = uprp->prv_data;
 
 		/*
@@ -473,11 +503,15 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 				dtrace_stmtdesc_t *stp;
 
 				stp = dtp->dt_stmts[n];
-				if (stp == NULL)
+				if (stp == NULL || ignore_clause(dtp, n, uprp))
 					continue;
 
-				if (ignore_clause(dtp, n, uprp))
-					continue;
+				if (bit == 0) {
+					val->mask[iword] = mask;
+					mask = 0;
+					iword++;
+					bit = 1;
+				}
 
 				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
 				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
@@ -492,11 +526,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 		key.pid = pid;
 		key.uprid = uprp->desc->id;
 
-		val.prid = prp->desc->id;
-		val.mask = mask;
+		val->prid = prp->desc->id;
+		val->mask[iword] = mask;
 
 		// FIXME Check return value, but how should errors be handled?
-		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
+		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, val);
 	}
 
 	return 0;
@@ -922,7 +956,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
-	int			n;
+	int			n, ibit, w = CHAR_BIT * sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
 
 	assert(usdt_prids != NULL);
 
@@ -1020,7 +1054,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 */
 	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
 	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
-	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + sizeof(pid_t), uprp->desc->id));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP,
+		   DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
 	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
 	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
 	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
@@ -1054,27 +1089,30 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
 	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
 
-	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
-	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
+	/* Store the value key for reuse. */
+	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
 
 	/*
 	 * Hold the bit mask in %r6 between clause calls.
 	 */
-	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+	for (ibit = n = 0; n < dtp->dt_stmt_nextid; n++) {
 		dtrace_stmtdesc_t *stp;
 		dt_ident_t	*idp;
 		uint_t		lbl_next;
 
 		stp = dtp->dt_stmts[n];
-		if (stp == NULL)
-			continue;
-
-		if (ignore_clause(dtp, n, uprp))
+		if (stp == NULL || ignore_clause(dtp, n, uprp))
 			continue;
 
 		idp = stp->dtsd_clause;
 		lbl_next = dt_irlist_label(dlp);
 
+		/* Load the next word of the bit mask into %r6. */
+		if (ibit % w == 0) {
+			emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
+			emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask[ibit / w])));
+		}
+
 		/* If the lowest %r6 bit is 0, skip over this clause. */
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
 		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
@@ -1102,6 +1140,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 		/* Right-shift %r6. */
 		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
+		ibit++;
 	}
 
 out:
diff --git a/test/unittest/usdt/tst.many_probe_descriptions.r b/test/unittest/usdt/tst.many_probe_descriptions.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.many_probe_descriptions.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.many_probe_descriptions.sh b/test/unittest/usdt/tst.many_probe_descriptions.sh
new file mode 100755
index 000000000..92a61d5b7
--- /dev/null
+++ b/test/unittest/usdt/tst.many_probe_descriptions.sh
@@ -0,0 +1,64 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dtrace=$1
+TRIGGER=$PWD/test/triggers/usdt-tst-args
+
+DIRNAME="$tmpdir/usdt-many_probe_descriptions.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Construct the D scripts and output files.
+# We stick 80 probe descriptions in each of 3 scripts to test
+# USDT's ability to handle hundreds of probe descriptions.
+for d in 0 1 2; do
+for x in 00 01 02 03 04 05 06 07 08 09 \
+         10 11 12 13 14 15 16 17 18 19 \
+         20 21 22 23 24 25 26 27 28 29 \
+         30 31 32 33 34 35 36 37 38 39 \
+         40 41 42 43 44 45 46 47 48 49 \
+         50 51 52 53 54 55 56 57 58 59 \
+         60 61 62 63 64 65 66 67 68 69 \
+         70 71 72 73 74 75 76 77 78 79 \
+; do
+	echo 'test_prov$target:::place { printf("'$d$x'\n"); }' >> D$d.d
+	echo $d$x >> expect.txt
+done
+done
+echo 'test_prov$target:::place { exit(0); }' >> D$d.d
+echo >> expect.txt
+
+# Run DTrace.
+
+$dtrace $dt_flags -c $TRIGGER -q -s D0.d -s D1.d -s D2.d >& actual.txt
+if [ $? -eq 0 ]; then
+	if diff -q expect.txt actual.txt > /dev/null; then
+		echo success
+		exit 0
+	else
+		echo ERROR: did not get expected results
+		echo === expect.txt
+		cat      expect.txt
+		echo === actual.txt
+		cat      actual.txt
+		echo === diff
+		diff expect.txt actual.txt
+	fi
+else
+	echo ERROR: dtrace error
+	echo ==== output
+	cat actual.txt
+fi
+
+echo ==== script D0.d
+cat D0.d
+echo ==== script D1.d
+cat D1.d
+echo ==== script D2.d
+cat D2.d
+
+exit 1
diff --git a/test/unittest/usdt/tst.many_probe_descriptions2.r b/test/unittest/usdt/tst.many_probe_descriptions2.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.many_probe_descriptions2.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.many_probe_descriptions2.sh b/test/unittest/usdt/tst.many_probe_descriptions2.sh
new file mode 100755
index 000000000..cc8821c6e
--- /dev/null
+++ b/test/unittest/usdt/tst.many_probe_descriptions2.sh
@@ -0,0 +1,127 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test uses many probes and probe descriptions.  Therefore, the
+# number of BPF programs to load into the kernel -- dt_bpf_load_prog()
+# calling prp->prov->impl->load_prog(), which is dt_bpf_prog_load() --
+# and the duration of each load are both increasing.
+# @@timeout: 400
+
+dtrace=$1
+
+DIRNAME="$tmpdir/usdt-many_probe_descriptions2.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Set the lists.
+# - The probes will be foo$x$y.
+# - The probe descriptions will be foo$x* and foo*$y, for each $d.
+# So if there are nx items in xlist, ny in ylist, and nd in dlist,
+# - there will be roughly nx*ny probes
+# - there will be roughly (nx+ny)*nd probe descriptions
+
+xlist="a b c d e f g h i j k l m"
+ylist="n o p q r s t u v w x y z"
+dlist="0 1 2 3 4 5 6 7 8"
+
+# Make the trigger:  Preambles.
+
+echo "provider testprov {" > prov.d
+
+echo '#include "prov.h"' > main.c
+echo 'int main(int argc, char **argv) {' >> main.c
+
+# Make the trigger:  Loop over the probes.
+
+for x in $xlist; do
+for y in $ylist; do
+    echo "probe foo$x$y();" >> prov.d
+    echo "TESTPROV_FOO$x$y();" | awk '{ print(toupper($1)) }' >> main.c
+done
+done
+
+# Make the trigger:  Epilogues.
+
+echo "};" >> prov.d
+echo "return 0; }" >> main.c
+
+# Build the trigger.
+
+$dtrace $dt_flags -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >&2
+	cat prov.d
+	exit 1
+fi
+gcc $test_cppflags -c main.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test" >&2
+	cat main.c
+	exit 1
+fi
+$dtrace $dt_flags -G -64 -s prov.d main.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >&2
+	exit 1
+fi
+gcc $test_ldflags -o main main.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >&2
+	exit 1
+fi
+
+# Prepare the D script, generating the probe descriptions.
+
+rm -f D.d
+for d in $dlist; do
+	for x in $xlist; do
+		echo 'testprov$target:::foo'$x'* { printf("'$d' '$x'* %s\n", probename) }' >> D.d
+	done
+	for y in $ylist; do
+		echo 'testprov$target:::foo*'$y' { printf("'$d' *'$y' %s\n", probename) }' >> D.d
+	done
+done
+
+# Prepare the expected output.
+
+for x in $xlist; do
+for y in $ylist; do
+for d in $dlist; do
+	echo $d $x'*' foo$x$y >> expect.txt
+	echo $d '*'$y foo$x$y >> expect.txt
+done
+done
+done
+echo >> expect.txt
+
+# Run DTrace.
+
+$dtrace $dt_flags -c ./main -qs D.d >& actual.txt
+if [ $? -ne 0 ]; then
+	echo ERROR: dtrace error
+	echo "==== D script"
+	cat D.d
+	echo "==== output"
+	cat actual.txt
+	exit 1
+fi
+
+# Check results.
+
+if diff -q expect.txt actual.txt; then
+	echo success
+	exit 0
+else
+	echo ERROR: unexpected results
+	echo "==== expect"
+	cat expect.txt
+	echo "==== actual"
+	cat actual.txt
+	echo "==== diff"
+	diff expect.txt actual.txt
+	exit 1
+fi
-- 
2.43.5

