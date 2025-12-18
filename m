Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0458C29DB61
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766089504; cv=fail; b=kQGYxJrGCVAVp5KSPmZnEL0Q5VHPpJmC7x1J3thn0xp/6gEnkXk06er0Dfjt3Z89pCvmpPmc2e7JmRHyWpx6Jv2YjBd7WbNYPTkzWz0K8l6tV+Y/O42QMQb9n1uhSjMgspjgje2I93kVX4rwGtaseViUPg5lImLS2OteQmBLtWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766089504; c=relaxed/simple;
	bh=qQUeDuQg4xQ2i0tfUooMEHZW9BxRN8hnF6QDP6Cg5Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lRhIVf9Ly4Z6F8BqNmMBhr+t5ZL9D6g0BvVYgeGFxjz8im9dD76wVk/NquDgEKxNYyBm67tVuV+1x1zoF4rcHKMBXNpFkwDJ85xsr4vRU77+EvRqYrgIaTREa3IMPewohCZfwKMMCXQjIz8pgC0uW9rmxxm4P45tttn55T4xJ3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ebryGLVT; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gcVbcKta reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ebryGLVT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gcVbcKta"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkToV1671120
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ei3xEDMisvcNvDbcqNHRgYlbJWkE++hz6l9AE31XUPk=; b=
	ebryGLVT38k6wK0nb2yGJzjQN6YhcltJ9JHDAqkTO4LhChS4jsH2VoiPUs/yxjSb
	yNJaUmUiYAvPaYmMpvDp3nDR+8rgnaMabhqEavaV/gTOlGl5l1m2KfNkco1mGhPk
	o6v4FlehbZOroZd50qUug/F5Q8FeYuOw5B8cE61eQI0z4ChZojdGWmwb55bB++w2
	tgi3q90ejjjZD4lfGP+vlYosCL5diojdgIfgQsIRs/0UVV1HkGkv/cYaWEi/WksJ
	qAgNEdLxsRxwGLqiy+Lk62qONDsrcMmmDOx8xp1b3f+ed/wojDiv/Jp0FpN2XYQq
	N0OKOO79KGcRHaq+5AnosQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2f026q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:25:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJTsBb035538
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:25:01 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011002.outbound.protection.outlook.com [40.107.208.2])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtrt21q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:25:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/cdSjIbUXbWRpbEuVJziRyA8llIP5cyJzKO+EAqcDodhvK5HvBleb854FVRtkSxAP/JJxSQWSE83k8k2ygUhQaGu767fjFJWyxqL7jzzAHITs7nSmmiLA44wZDHGUZcohTqsjp8Zd4+d44tDAiyhwm9KgGZkdeAvcXBX2pc6VXW9d+tAMlpK3YSEHdcztq6pp+Inr5mCrk9c+HJXWUtVE/7Fr+TsCW0MTdeg62yDOraGFfPVe0YkfTAZE8gqooiuVfuSWhMHf6/zm/Q55p5KTYwLrlUxT8mDF+rNsV65zI16tU01TeEsiFVhRlPOxnCdSjA3kKXp8v5OAaB0oU2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGYIKPWGtX5TPAz1shIR6ZGJHvaguOZ9eKNa9zjjeLo=;
 b=sgvacuipRseXFbxuo2TIKANXQbuJMNAaP8IP2o39YbTOl2RjZhLW7j4zeCBWD7i470S5XJZ/dGbCaRprc43S8A6UoJwdcKw4z6XaB5DleBx2YBLxYqPSQCeXtqizzLL28bAU3jgVF5ae+XYLVFZvnKH/DCxVQ39+CNtymeE178zt1/G95Ij+G5VnxyCkYLFUEF7dGSH0r9kLrm2e3/RG1mjSyhqjnzIe8crq/ymPusLabLyez6Z9103FCtDr0hb/JUwbnPhM8FpsnatYmjrqajgxpQBV6L9xMqO38A1m+3CwGRZND309BKV6MhLQicXe+NDYr/8OI5TCgMJmi2/7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGYIKPWGtX5TPAz1shIR6ZGJHvaguOZ9eKNa9zjjeLo=;
 b=gcVbcKta0xZ4LbVw19DCAomGXbr3a7S3Zowr0KqlvyPXDN77zVMV5uwTEGn43sCmBgJ6xThnxqgBZW+ZQFt3tO1uimqVRCILsmurjdtVoyPjIQxvI7kcykd2zMLmaBmqEaZCtFXIj8F7n01tKYOwQfWrDhalgBsCbwll+dRhC3g=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH8PR10MB6576.namprd10.prod.outlook.com (2603:10b6:510:224::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 20:24:57 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:24:57 +0000
Date: Thu, 18 Dec 2025 15:24:55 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/4] options: discontinue -xversion=V as a valid option
Message-ID: <aURjF0z//hh7Q8/4@oracle.com>
References: <DS0PR10MB752231FDE310C37F66EEEB83C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <ff96c7e8-da13-0b5d-5a80-7bd5ac690248@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff96c7e8-da13-0b5d-5a80-7bd5ac690248@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH8PR10MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a94efd0-e349-4765-0a84-08de3e7382de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?zybNwdZlXQlk3KylCIadgpJypQngYAoTJBRC8Kxi3AyE6az9kMrOC4uV2E?=
 =?iso-8859-1?Q?1MHHNDhmTxi2HabJXT2xxfzEYsY0DNCZ5GFggx9gIMXlyE7iGFL2I541ak?=
 =?iso-8859-1?Q?IZwWQ7zFxplATNsjNDeUL0b575IYUTUJc0rpFC9b2xMUiKSgwNKK2jfhEw?=
 =?iso-8859-1?Q?bd9CHfXURazvk65RoGJoOX/FgPk5CggUeDmZljgU/96ursMMEwzQaWgm7K?=
 =?iso-8859-1?Q?ugHmPvn9vZnb0VyqbcPtxA01s1g2FHNwRQKTxAa5uvLNH3F/x/1Dx3zplD?=
 =?iso-8859-1?Q?0fk9z6+ae1QnR35R0YGHLIHumtcGDguCQ36FzPsCqvSlzIM4QCzsbHyu2P?=
 =?iso-8859-1?Q?XoR0aEppUFEURQzxTjjI9iONU2j/FGKfPT5ukaqzSpQCZsrBiPwJaxgLG6?=
 =?iso-8859-1?Q?NBAuleQlX4ghTwW97nb/wuFJ3H5nTvBgq0cOCPsTDR4+u/hjnGvAdNBNbt?=
 =?iso-8859-1?Q?MXVzYoVZ5X0Uv3dH6FszSb7QH4hYbV6mhTR1m8q/XjbJt8ORAJYwemf5v+?=
 =?iso-8859-1?Q?Y0m9haSXzI5kKICRFUCKypDOacAl6o2ayuHQlAlUk3aag+tMzvSdVgVKh5?=
 =?iso-8859-1?Q?ITznynbEFax/2Ai5ZSF7mASKcxMlAERlrgUKS/Bk1sJ07pTTodzH4YWDY6?=
 =?iso-8859-1?Q?anIZ4+SF2AjmP4ldNwIsBaub7fQhh/iznyHEoYXZvnNaTbrVsjS5OJ4rhM?=
 =?iso-8859-1?Q?qS0+4W4EklAquOPDiZ4p/3wx7hIRPsk+5LpMpQfk/bYyWJmbbYtMNsIBOg?=
 =?iso-8859-1?Q?F2cH2E0WGo3XNJATIvUVgrLBwieIqDStdokDe28zjWQghX4UcoygVn7pXC?=
 =?iso-8859-1?Q?4sN2ICI33fiWzYEz3vH1FQMvfT7d4TAMvBBFeYPT662q7PaFfleP7e1I+D?=
 =?iso-8859-1?Q?G7J2/w1pTS0o+B44CLothPa8WqKJvcvl9EW6/sluPZSEnGtJNky8cH1mwT?=
 =?iso-8859-1?Q?wNZRFDRa9Ss1EjBV+YdVEqF72B508x78Z4sqjL8tIAM1Wf66qihUOXr6aI?=
 =?iso-8859-1?Q?4JKqCNBn14fJyTP1DkUb3u6tM8FymKQRBF5Y7WBzlN6ocmfXouwuPLTs0g?=
 =?iso-8859-1?Q?Ohav4Yf0Y/hBCKUj/yv7QRt37JoWoLkEdcSE4g4nODRs4+7cQJZvS+uOV0?=
 =?iso-8859-1?Q?+g5CPKjTx7tTK6+h5RcPEE6imw3GUklEIsfNHlFSwDXb2zFYOXZ4KoD4LY?=
 =?iso-8859-1?Q?L9NgKjMkSYysk90d0aKU2FnfTHwqKbpYNnCHJGYUqYgCKZn62+0UmglmQI?=
 =?iso-8859-1?Q?fRZLpTYI6C5PnGE1UDWGSUHAkBd8Eprm8UIFZWFV2KonfFZQ6vw8qViqpm?=
 =?iso-8859-1?Q?45l5yJfWYlcPdJOKoZv7pI2iEsph2JZIBd7g9tR4OSGJdokaqyHxLQvd7n?=
 =?iso-8859-1?Q?fHbFD7TjhWBdQ+NJP+SWYh8mCP79Ltwx1FEmW3cgdcPxkxFUTizspufkMD?=
 =?iso-8859-1?Q?GcStulA2FR/7si/IQLxTgjWLLUEfQC/PURgt4i6XInwOy6MEvn/Jq2tAx5?=
 =?iso-8859-1?Q?ekZDpXqwrP7rvz0rpwpZJw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Z24wVZyVOAiwBAvBeUopx+ZtA5Z/i7BEWrhS/UfE6B1gihWTVqhEz08NWU?=
 =?iso-8859-1?Q?mBZD9HC6mw8g6jlsoxV+Kms8fAlXIF9TFs90YOOQoeTBoh7TzEPCaB+UnB?=
 =?iso-8859-1?Q?zQoKFCxlw+LN2etny59P6muGmHlQ1hdzK2KLnvVE6+YBJroHaSd+TL24KH?=
 =?iso-8859-1?Q?RM1DAI43iL8R/1DPG3qHLYHEOjlGFT9BwdTBRmeAEJ3BsVtSeXkO3YRlU3?=
 =?iso-8859-1?Q?To8tOriLvGhhvrieuSlde+5vJ+rYitpv4+FcDCI7QDZoT4y1gfK9q/qwuD?=
 =?iso-8859-1?Q?vwHDRrLRL5+MOMyJcTZ27LQCxswBA+yN2wU67VyfK6FKT8BKHLVcfB1UXn?=
 =?iso-8859-1?Q?RroyOKB+SOshm+cBT6ww0KBpNcCUnQdK5su7ryomMh8npspqoN0EozLePO?=
 =?iso-8859-1?Q?QvFt2HUZv/rjejLgAmWwLS/6dav+kWj313Yw0Dpvjp4Dmm8q+KxI4syDDb?=
 =?iso-8859-1?Q?y46ypKQ8yCIhSKYErYE1gzMkRtVuNemaQi3KDIFFLvdJC/ij5E5M+DOCIB?=
 =?iso-8859-1?Q?yyBlIWrplEHih0cJjkV+S4a6FFf4ASAp9iBXD/FU1zNJMTed7YVp9Q3Xy1?=
 =?iso-8859-1?Q?WaG5/CkynE6A+rvUv591acBbzxUf9C3Th7ez6Lfql3fBjXPVTGQSWPhdYO?=
 =?iso-8859-1?Q?7nILVdlYtroRuiOw/zu9hRnCPpA8fRy5bWkwgawYc6kcJZ03I5VCTmdRre?=
 =?iso-8859-1?Q?j33XfzsiNpiHyV0hRxZ1JyAJK6YWXfguKeztqzrq83aIxypQkZrR4s9YOC?=
 =?iso-8859-1?Q?WN1Vzgwp98URTL6lt13nPNffaCbJrsRaa/Ufxb+L1k8f7x+gR8I0nKOzUa?=
 =?iso-8859-1?Q?4ZYKKtczr7FH/+sMcIfa/8VeqilBTeVKjIhBCmdIRPTR3MMDLfkc2eWfNo?=
 =?iso-8859-1?Q?wIGmqZGZXy3pbYlARFzwHB1D0QoU/OerFzKGC5n1szGY0YwPgP+rMqyfAX?=
 =?iso-8859-1?Q?A/3FCJbO2ZTMkA+mFrBUDZcaXJVlMqoBzP3vb6a2/o7tIyOIJXVditg+tx?=
 =?iso-8859-1?Q?cQGd1f6UCp1Ma9PxZhcKYmUHGDCEtIyFY3nanzN1bdujKXQVsuxsXRJs/I?=
 =?iso-8859-1?Q?BOyeFXikRnmMI87O+1ZRGN5bjMQJ6e2He72cctdWZT3rdwYP4ZtXR7mb3W?=
 =?iso-8859-1?Q?ogg3J4yCU1Nj8NFdUKSvhZSnOdYdRrff7diTWpCws78lK7BHsjaDu/LhhZ?=
 =?iso-8859-1?Q?sUsDnyx1uyZlbyv7/LVaneA4Eat8S01nlJWjiKRyr+9/bTvIxIl9bHcB0P?=
 =?iso-8859-1?Q?PpccijzUGPlfXGyEbakR1/UP4U11sZx0t3S/NALgoZLKd3Gsn2KD+ynlNo?=
 =?iso-8859-1?Q?ICx3FCYcJuIdYCJR1aIBxbIkaPjQiVGeVAxRBfxJed4ZedzNL14b8zVG5+?=
 =?iso-8859-1?Q?ru5pOJolN/FNVw+Qq4Sd+3tK9MaOAnN+uC9IZQZJntsSf00bffsHKjp2Rq?=
 =?iso-8859-1?Q?EfagD1Y5/4B2+WZ7G7yeJ8tUUD1tOBSj5KsaLBr+TniF/sPv9oGnYqUfPJ?=
 =?iso-8859-1?Q?EjQderr3VyqTKt82h4LY5CyEHD8fE6egIuN9UBD2mcTykcqqPHSQ36Nj7Z?=
 =?iso-8859-1?Q?u3wMf86f0CdVQRJeelNsSVybxYcK1tvvGhK9jaiTYHIot2MqB0X2v9hnvW?=
 =?iso-8859-1?Q?Qv+wSHzuaKWO/pUBoKGtlEgkl58MObhIryaSUHdK6St9kyoK0XX81yAg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KDAN32BJlhwkuNenXWXcRc8XIdZSPx2YZ2va3rc+Qq+HFkMAfa1ha1ExlULFvtuXDeP/GCuSzODlokN+A2sxWa1bUsjrA5ucOiOR/XI8Sn8TBRSAwsBIKOuNhXK958T9xFbCPRdeeEf+Yjf3zlFxyrZgI0qlnfEMDpfV5TygQbySGEglBOSEgwdX+sIU6PxmsRgAu3i5AgZzXI8cV1aibUC2e7FAN+xQ6TvzCLp4HaLTvc3LcE+V7T+SWXR6hBMaH7WFMeN5oi0jqgRJ6m8KVoHo4NwFxncy1lrqQI8hDzhC1jjVaWUjw32NsprQmg9Bvn/C/1orTYT6+q63pbeS/D1KbFRGvAxGuj/GhKez87P7HZrnzwS29ozA2aeY7vshxhC5MHSSLFTiYEdGrStUKpFlTjgtOFR3sSGhbhXErQucg6HQoguJVeupBZ4b+ZZMKsRL14+0LFiHeKG5/UCTWJUeRNvhAy0BJQcoLC+IWy5zXfYPc+64x9NRIVumBVQ/3ZxjOXZiNM0tSvMsXqb9mWfn0RY4z44Q80I+vFM+Zl9Aq0FIPCuFyd1LHuwqH40pc7InqUGCAe66J4GkALT503UDdN2ApfWUpP8Gn0R+EfM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a94efd0-e349-4765-0a84-08de3e7382de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:24:57.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZmunwc7zT3z80psd/KRFGsuM8Gtr0isRTuSh725/pgNtADtlDguKxXAHNbOcu3jLkSRG3LNflyizUcAgqZB1PUZ+bqTgjXnWQpAbbxawjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6576
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180169
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2OSBTYWx0ZWRfX/38c6kNDor9o
 Xjof8+rteRHsgWnWIosP8O3SLmdq92uQK5JqWmnFJ2FVBBziLLbUwnXFrXxgz60OnOOMxg4Na2x
 H7rp8tS3VW0DKPeGimPjICpJqs0ln5gmoP9ttFcOCvgrgXsC21+1tJ6q1rIdYin5QZRauKvDRWA
 7ScTtcqI2r9OviqkdO0w+Wj2tuinL/+vTXjGs4UPGOu3puXSjsOWFq1FhWU4W0PkGADBaxHAsOs
 aPwB4JHY/BsvDQOgOMEA1AB/NbRCiIJesBPI2JO7p6BykdJTOZtks1PRO3OHftfqZJsBTLRbtiJ
 zskzDd2F3/UopD8X7MhUmlhJfJzo9De1PgLUL94QCatOsJLct9JKK1yJJOAgSSTFXSBqbMqTftH
 R7vv/FlCa/6HeTknM6DWRFn8TS+VZ3vbM9jN67ZrcYQKCiIOK0dZv6t2yUfKc/NqvoV/cTBYJG8
 dMAAeQzj7rboq4I/7aClzzxMaLzcqbNWU9GVbK9w=
X-Proofpoint-ORIG-GUID: kMCWd4z2MWHWhTCMd5-f5OcNLudl96TU
X-Proofpoint-GUID: kMCWd4z2MWHWhTCMd5-f5OcNLudl96TU
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=6944631d b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=RwudLcymIJLeGfP2GpQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:12110

On Thu, Dec 18, 2025 at 03:22:47PM -0500, Eugene Loh wrote:
> Okay, but there must surely be test-suite changes.  At the very least:
> 
> * test/unittest/version/err.1.1.d  The err.* tests should not simply fail; 
> they should fail for the correct reason.
> 
> * test/unittest/version/tst.1.0.d
> 
> Maybe nothing else???

Right.  Making those changes now, and will post v2.

> On 12/17/25 00:10, Kris Van Hees wrote:
> > DTrace allowed setting a previous version to operate in compatibility
> > mode.  Unfortunately, it was not fully implemented.  Translators are
> > not really versioned, and if a translator uses an identifier that does
> > not exist in the version specified in -xversion=V, data structures end
> > up corrupted.
> > 
> > Since the usefulness of -xversion=V seems to be less than the effort
> > needed to rectify the implementation, we are no longer supporting this
> > option.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_options.c | 14 ++------------
> >   1 file changed, 2 insertions(+), 12 deletions(-)
> > 
> > diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> > index 97516517..0a35e852 100644
> > --- a/libdtrace/dt_options.c
> > +++ b/libdtrace/dt_options.c
> > @@ -24,6 +24,7 @@
> >   #include <dt_pcap.h>
> >   #include <dt_string.h>
> >   #include <libproc.h>
> > +#include <port.h>
> >   static int
> >   dt_opt_agg(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> > @@ -676,18 +677,7 @@ dt_opt_invcflags(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> >   static int
> >   dt_opt_version(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> >   {
> > -	dt_version_t v;
> > -
> > -	if (arg == NULL)
> > -		return dt_set_errno(dtp, EDT_BADOPTVAL);
> > -
> > -	if (dt_version_str2num(arg, &v) == -1)
> > -		return dt_set_errno(dtp, EDT_VERSINVAL);
> > -
> > -	if (!dt_version_defined(v))
> > -		return dt_set_errno(dtp, EDT_VERSUNDEF);
> > -
> > -	return dt_reduce(dtp, v);
> > +	return dt_set_errno(dtp, ENOTSUPP);
> >   }
> >   static int
