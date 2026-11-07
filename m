Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066903;
	b=eyyC7c64x76JnWGygLnE3iQvzWlBua2MKvg416US1KX5JX3ZCkg336sNdKwBNrZ9jKCi
	 xp03N7Ajw+wLmosbYYlPaTJvhoEAX8/O58rWbKw9Teu5AVGGOOeffV8ICEYDdzscw4bJQ
	 DTWgtk5JcJeKIggaAyDHOptgqRy3+CCrHwoMsggR+/WJ2uB+d35ELdAGAm0loWvOS4uvL
	 Vkp4w3c8TtiCL7x75DraLDGiRXGlgd0JNaTokailHNJuuAb2NtzEsS8YcrlrHkVTgFUgL
	 JjTRea9HWu1sYEcJwAZJ1jrLM+N5z2Pls4p5P2yipm9LUoawWPJc+SVkDaaeibq6BJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID;
	bh=+ush/eUWNY/1xYCkJrPnbs8+NzYbEEgZf5JijBeZE3E=;
	b=m/i4HCYevL622lbeSc9bpJhXXmk/GnckXL0+pTIRfjBl2pVGA/oMoGKPicb7B2WaZKt0
	 eJ7WMAMcgtS6aYOZ+X5j7hYDdjYrsBaZk37CG/bTVou0ZicmP6kgk8qdm7Z7bqiyv9PIx
	 w/PW7oEjjRs4Q76pdDW3OdU82PMa1fvVSD8RStVKbE0zhPHaLmmEHDchF5skrH9lwdGl7
	 DQ1Rt3fbNJr2DZkDCcy4zZUYA9YAzrrh5lDN70jmGSoM1FhFyI5OL8GVwLGfs7JRW+WMC
	 8iq+UBX08aCy+Ko8qGICJyDBjgyUlz8zNJ3r9VFn4kkUEXouzS3s3cKD13rBa2VRITw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b="nb0/WDvf";
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=s9fNW2UM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F71C606A326
	for <dtrace@lists.linux.dev>; Sat,  7 Nov 2026 15:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F71C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=nb0/WDvf;
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=s9fNW2UM
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7Fo9G44134111;
	Sat, 7 Nov 2026 15:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+ush/eUWNY/1xYCkJr
	Pnbs8+NzYbEEgZf5JijBeZE3E=; b=nb0/WDvfB+t9CzhPKiUkOTf/B8BTgRnM+4
	lreJmjOl+liK4zJEo45fcbwKzNA/mFUllVlgrFNP4akfWoOyyLsxRz+FVumJiU41
	D1KsgFVFGgKhY2W0FLnYKZQAyQSYspyR/bJc163JUfH/IiKAf2JBSt933OukMRsU
	tMGvsJOQu8qPInq2vePgCEweRc3n93p37F9ABXYu24Ly2LyKr5/0zuVqwu+wwIQH
	mtpWY0oGmK2EfulSXLCzjr1PjW8TacEg47gBA3T3D+XrVyACNrbPJGoVfBoO0R+2
	U+yLuPaolgjzAcd3WcJVxZuAY81ovsESi32ZJ4bx7M8v6zezgnUw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hsvhs0ab8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 07 Nov 2026 15:54:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7ExsGO1417536;
	Sat, 7 Nov 2026 15:54:58 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ht22qx6c1-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Sat, 07 Nov 2026 15:54:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDTK3hiTJoF36jQsOKlUy1syXPwlYIhAZW1hOYI/w8n8myVQ5yYq8CA+chAuFmV1G5seuik/JvNSeTGaOl2AjTJJMGnl0DBNj1QV7EAXFMc4MLa8Yw3fztWTczRH+N9VaAZILQNNSoA3H09NFXZjcpl2D4VfvJTG+p6dpV9JdBcP56Ti66aFrpCEjvh5JPe7BkBWQBgTgVjqAkiukrxSCh08L/UpoONYgZ4Fgy3IH5OTwP7CX6wRCUvHc8jbDwjTR+YsB3+tA9GfQbKQ2YFSeADkgaM5dzTYoRDUBnNpyG17BNzcPjLTf79EWQjzmNqhyEQDIn6wUA/BOB4xBwhD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ush/eUWNY/1xYCkJrPnbs8+NzYbEEgZf5JijBeZE3E=;
 b=Ci1PCk7QQMsH841TO2BRrIPsmlcLh/ZY/ASqZhNHcMFzAwvBXCQGPi/NVAAojLauhYO73wFuqDkxWMm5lTmEnBSp2y7wD0aNvVbMlI7YIFYPki4Cxs+mZTS7Jc8Y6aB77skRhGg4qnFPSSdRMvHHe0LyQ8pYx8G4/SW5YmkKzvvBhY1QdlKbaVnJwRlDrz3fOcXtaAjD8s+LhGNRgxQdxYP8eM86j9/rNQToCeQ6fgNA05DCTrHFQU57C+XEC3FujZ35L8KlswBQ8eA+KWP9pB4q1YCCn3VClzh1nC0PUNLIstkGk5nybTDYZewpMXNy0XGghVpr3SRvqWTR6Sltsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ush/eUWNY/1xYCkJrPnbs8+NzYbEEgZf5JijBeZE3E=;
 b=s9fNW2UMLT3V01bkQkl9Ddjxk9P1I5YJEUIs4rMb0YDNWjFVGncOR6yew52i63HPvcYLc4uZeGU6A8/eijZmAVgk0ZOsP1OgeV3kdAVSWGQj2VhEIsDBvFwkGnJzSPb99domD7r8IIACViHLi6KAHaccDTxEemqBfXg4fZOppE8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH4PR10MB8122.namprd10.prod.outlook.com (2603:10b6:610:246::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:54:56 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 15:54:55 +0000
Date: Sat, 7 Nov 2026 15:53:14 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nix@esperi.org.uk>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 09/20] libdtrace: streamline kernel symbol parsing and
 module lookup
Message-ID: <au9Jamtz3PtdAnnr@kvh-deb-bpf>
References: <bf45a777b3fc14c2223d21c81a84fd13@oracle.com>
 <87eccyt8xc.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eccyt8xc.fsf@esperi.org.uk>
X-ClientProxiedBy: PH8PR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:510:2da::20) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH4PR10MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: e72fade4-f77d-4ce3-af40-08df3ce777aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|4143699003|261102123227099003|261021135927099003|261022105027099003|261022115727099003|261021130227099003|261028144727099003|261026135527099003|261026121527099003|261026140227099003|261021121427099003|261026130827099003|261021133027099003|261021123027099003|261022075727099003|261022113327099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	P7zvnVCIAxB73eXu0CaDXIHWB5ZWetez9CHUr9IxYFlNIWmCenf6IpFFiUL9m276yax5L4SEJ04J+HF2o3kFD4RbyTAL8RpduVKTm64PB3p2+Q87sNgeHvJT34lPZjCgVs/g+Bc8uXG1rNL4qFglHx//hLOAJz8AxGrHmog10vCScpgJ8/F7+MMGr5xXWHS+HXQ9j+hEiTSYlFoXeyk6KYPaG23V0Wrcylwpz0QR7zAJ0/zqt87HSA6pZtoaX8MXzJSr4yaGnl+TuGc7V7y8zzQB6iMjpoeB2lKYOBen6zl1tdHm239n/V9wK5ov+2cIlbFTYmgSYLQKK5kkUSJFUFFhjd/7KHHRSdg26yUfs874/DNLQK2klL+an8gyBqSsmviDvjd/3SJxp/bamhrqAOidB6h85ym5/V3JOcIMgq5iJQaZW9kO/zNVjRQEsYNpFJJjEBogVdO7/jl8bS+BZ+imcyLNL11TN9hDWYS396Biot6N2RtQYnJHnQ0KQly72bcpigr4UmKi8NoGfp4YX+fm4DqNFXHFBeM5CO3OXusRzP8vvL+lQtS0yzApkXPxKc+eQMwYjkEDdWwXBkOkOU79cFtWnPD+amapbCVy2ksIS9TmHsmv2uF3lURc7hMxnWE9JLO2TNdJqcGmVzQwtRdTOhLuaxC4bgB28MOGrhg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(261102123227099003)(261021135927099003)(261022105027099003)(261022115727099003)(261021130227099003)(261028144727099003)(261026135527099003)(261026121527099003)(261026140227099003)(261021121427099003)(261026130827099003)(261021133027099003)(261021123027099003)(261022075727099003)(261022113327099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ns2pKOfDhGlpquoVPFvuNppNrZjC7YQFVdF1ldJ2ojeglbMRY/FNSCHQITOM?=
 =?us-ascii?Q?8YVFa5kM5dtsPeNIF5Gbbw3H9YGI+ztZxKlEInKWG93IjS72fjz/VnHcJ1qA?=
 =?us-ascii?Q?LDU+5OCnIeegkkvPbuKSmsHATj6HkCdeBzq2rNejFpowy0P69LN8Y4TlA1oL?=
 =?us-ascii?Q?IPXftsX0U52UfDrAGYZB6GpARGDdFCDdtBfj5D6Y8Bjhun1V4ybs2FTJ+6uw?=
 =?us-ascii?Q?FTxyBa/nMMPelbaFmDA8jsHHeUNwvZrfFifqOjCcbZLVE7gmw7GDTht8bbmH?=
 =?us-ascii?Q?5JHc4ai3ROLCFyPq/1lpuDAx+I8GPNlzMeXGzz+VI8bZezgsrlqI67v6qvPC?=
 =?us-ascii?Q?hRvYz6OGYw8b6BvVv+mmHhJSNAEJMCFy1f4mHpQT2dJyj/BuoRrWPjS35mMl?=
 =?us-ascii?Q?wxW6JNkCgcsqxDsSainOs0xvybiD3Y1kWoH0qeFs8fvL7C11cd4WC5AGa1i2?=
 =?us-ascii?Q?2UqDDrLxYKIxF3NqF4bAuGl/qoBWAHW/ezQkRUyM0AYmMLyyJ9I0fihnWKwb?=
 =?us-ascii?Q?kgpDibzNRwYjzyrBK93MaW8srHU0lZZobg/FYtdcIuoPYMNSKLgpL5ZpOBDq?=
 =?us-ascii?Q?4hNVA58Ju5DIJj1ZG1EQmvpbwGkZ0zYawNDiDHOXNqePPBFlnsc5S6fpFiIv?=
 =?us-ascii?Q?OSTZHgnyClZY5sjdafNFjWAP/89YkwRO35sB5Cd+GhgliGCQvhvG8AY36ZUI?=
 =?us-ascii?Q?78gXDcW9jjsRXZ5lRdxik8FjhHKJmTYKCfKzUCw5l5dlQ1gQGUt7cRqAcQoU?=
 =?us-ascii?Q?rPdA2WzzcZSN6O/4k7TVUKB1aevEg7C5b9sQ/bRaY7MfsAoboFwoqN63IidU?=
 =?us-ascii?Q?ij+77TSETz+47Xa/qvtUtszOWSJuyEDkrlT5QOMukbaOqwdcr3IewQaagQcU?=
 =?us-ascii?Q?otki/4F01caIKD/S2yb17FyfWALfccY7TLrm1TEy2Xhei5CoTmktMtPIoAUB?=
 =?us-ascii?Q?VQ4Mi7hnPIg2oY7z0POF5hbnP+I5T+Vcc5qz6UwlfzYlPjhXF4n/B3OmBQz2?=
 =?us-ascii?Q?mslnKYSDmk3wiPKTy8j58cpeErDreLxrH+GFdYBRrZAAidVFaLcnmjDwx3AR?=
 =?us-ascii?Q?7VoG0wY1xdlqhSzQBNHn29CB9YAQv4v7/TJL5iuA7AIuxrDOuDCuKZOd/AmX?=
 =?us-ascii?Q?H2plvQkhEfrECQy6fHJcWdAy4Syl+MNRGrPnGLAnGox58oIlPP6qHg7VPSVP?=
 =?us-ascii?Q?nxC7tr/Lw2iz/220i/9sOfKb2nDNJQgTWf6+ZjuXsaL2k0tFxmdYIpp6nvrk?=
 =?us-ascii?Q?F7JQjiCwlNao+FpIHwm5V/QNiVCjcHu+GQtR7QKyqNZTBRonHPZJTSERHa+I?=
 =?us-ascii?Q?ju18OnDTpcVbT0fWNCbDX76EmY+S7eOILDV163EQjCQ1qF1DL+8puJU2Qmuu?=
 =?us-ascii?Q?IchxSxeFnP3pawy8/ngNlDHTEwxcRrT+ZClWYtf9NhQiA0T5I1sm+N9ClmX5?=
 =?us-ascii?Q?155qsXJ4O1GV9zHVh0PaOblNC6RqIliISDAVigxSCiam1llp459NmatNSef+?=
 =?us-ascii?Q?JpumXisCCQhCX0E111mo/DeLzsgsrizvCdu/87SNaPcRXVtc+C3NuCPNaucT?=
 =?us-ascii?Q?sCSQUQ7jwLsm3r9iXKuSnnv5OdzjCymf0WKqaB7buQPRp8Q1dagHwJ8KsmUp?=
 =?us-ascii?Q?6pYwylrt98yq+hDxX2zB+C1q40pi2uLB+v7WplS4up+woBUNLY1zM+1CXaIx?=
 =?us-ascii?Q?TCIwDY9xq7yoe/O8dEynSHMqXT2DHZyCRXEgEafgBq3k/d5EwxomfTpLkqhj?=
 =?us-ascii?Q?pT3yu7kQQQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	U7NG5KczXcRE9Muqx0174iAE383NccPU1B1vXP09XEPuvqPI1zkcWhsCUSDCiH1sNMpidoDNl6S6wbvovlCwmhbV+YLpvyRXqI9eLGHTmWWIT7QihiXmr2S8pkUqHSdIPZkstfIFl8mGDEKtGGf44lBrxJRsmWiI3kZbhMY88p8CdnZP1HbI+xuyPKRHcQrGcKC1/3RzGXNKxu0qnKOiwHOzuZBmS88Xh2Y3MJWAw24T09m2BfgS5KYqRbFk4ymGomFbvvDubru4KotNCa/bSBAEZAZWnGJ9jyv298J1nsigdzY7nakSt9OEsgk4OyVJbtIOsmI/qY5pLZnHKZ/j2A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L8IQPhUxMquhqHhj2ilj6/zZEQ/7JIC6Wv91UigpDWoLc6caNBuYZGFsCXTOADjMAmZjM8Wgmirtj8ZIrsYwlM+pq6H9kE8khtBVCKXiHd67Q7Zdq26XCbOByJCZ5nM+sVEkSqoZUtbxXSYm28GAbOg6UXDAY8So9qLcaohDAXMZ0pN601ATb3afvrC2eKm4H19gzwOtjxOJvl4MR3zSxR7afJQZ4/tlmWoBKc6kM7uWgXJROBUho2D/Ov4bh6324Zaf/39BsCd2bepx4i8uFlyW6kgAlMlx0180cSNgLu7+uiItI2v/V7DEYRtVTy4ezTVtsZWoO+eX69/knIN7HJK4tATXaT64ZEXhuiH9gZeSvEYKefhEoc907++TuTn8A9Qb+ntMWcmbi0FrHIS6n7Vghs9Bwiit9NLFN/GrZg2C2lh6cKFnD0p+dUpu6klR+4Ish1bjbN6k62K+oXkV7AI5z7HlwCaU4cs9ltCqZpLsvpVsHDNmhXuZwZvrULerlfXIadeKFPl8nxoZEo7XnBmiy1FJV/rc0ztJq0pVPTDWvOFFWOsdln4WZn2tOQ8qwWmqW0s7BJ1E9t9QBEJZpscruHqSc9kxVBw7X3aTBkA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72fade4-f77d-4ce3-af40-08df3ce777aa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:54:55.3659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbFe2uirDWS/xP/dRvYicl6kWJ4JvyoIgByxLiWDOJ3GDlNg+LJxrAVvAWJPRdUmVxA5ziRhzVb8E+WzhiJjH+IYPDB/9bD1vus+02MXSI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8122
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070063
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA2MyBTYWx0ZWRfX+l5a46geV/bH
 4UgQBmCoZyPdZZhRZihouWrOT1XU1Amb9T9vWUFKYbfjq6AsCko1Wb05xC6cvP4zGew/EnvLKcS
 otaGfqYw2oQfFmvY5IdLJPzhJWuYTHjSaBw2elzhWRZOuABtTNu4
X-Proofpoint-GUID: bCgu9_bPUVdI77NkGoXapsIhPFuD6S_1
X-Authority-Analysis: v=2.4 cv=B6EsQ+tM c=1 sm=1 tr=0 ts=6aef49d2 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=NDs0iXRb4jTmwgze2kgA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA2MyBTYWx0ZWRfX4FcfVOlz3t9+
 EA2eqU8q4tIv7VwZLF162DntpUsObLk9DD9b0ck81Rpc0K1j0kYHvtxsv2RiXD4kMLO0ONfF9dV
 zo2PcEzo0zCy5gOg/MUdjMzV5/s+tXekCQi34WmdwrxnBZ7CyL6sp4IwTkxEgbluGaDiw3eTAaD
 I6+0TIdizhZ9dcKwpbEmScosyDHEsPTdQ99yv8zazqAFCnB7ug63Cg2W/lgiGGYvsDBVHxEtmFe
 2GKzuShkEB2u/sIZRsgvBMlWC53SwK8HntSva3nqA0ic+eDh6dMUjr7/7XJA+ekh8VnTVH681Qw
 c8Lwk127Td7p3hroCcSec6JTsW4PI07rQmtZ0cJOdBQIYKGci/pP/7zp6hgUB7nj24cliHhQLmZ
 4dubMsssoA7+qak+BUJe52RJKXv1t6i1iIXGCyJDpvu6hFCuEnIQpHamBnD05JSjiyeaxcOPxyb
 fiNAfEmtLtQw9NCWEQQ==
X-Proofpoint-ORIG-GUID: bCgu9_bPUVdI77NkGoXapsIhPFuD6S_1

On Fri, Nov 06, 2026 at 12:56:47PM +0000, Nick Alcock wrote:
> On 30 Oct 2026, Kris Van Hees told this:
> 
> Is it really worth replacing sscanf(), which though it's a bit clunky is
> at least used by other people, with even more hand-rolled parsing code?
> The hex parser isn't too bad, but this:
> 
> > +static int
> > +dt_modsym_parse(const char *line, int kind, dt_kallsym_t *sym)
> > +{
> > +	const char *end;
> > +	uint64_t value;
> > +	size_t len;
> > +
> > +	if (dt_modsym_hex(&line, &value) != 0)
> > +		return -1;
> > +	sym->addr = value;
> > +	sym->size = 1;
> > +	if (kind == DT_MODSYM_KALLMODSYMS) {
> > +		if (dt_modsym_hex(&line, &value) != 0 || value > SIZE_MAX)
> > +			return -1;
> > +		sym->size = value;
> > +	}
> > +	while (isspace((unsigned char)*line))
> > +		line++;
> > +	if (*line == '\0')
> > +		return -1;
> > +	sym->type = *line++;
> > +	if (!isspace((unsigned char)*line))
> > +		return -1;
> > +	while (isspace((unsigned char)*line))
> > +		line++;
> > +	len = strcspn(line, " \t\r\n");
> > +	if (len == 0 || len >= sizeof(sym->name))
> > +		return -1;
> > +	memcpy(sym->name, line, len);
> > +	sym->name[len] = '\0';
> > +	line += len;
> > +	while (isspace((unsigned char)*line))
> > +		line++;
> > +	if (*line == '\0') {
> > +		strcpy(sym->mod, "vmlinux");
> > +		return 0;
> > +	}
> > +	if (*line++ != '[' || (end = strchr(line, ']')) == NULL)
> > +		return -1;
> > +	len = end - line;
> > +	if (len == 0 || len >= sizeof(sym->mod))
> > +		return -1;
> > +	memcpy(sym->mod, line, len);
> > +	sym->mod[len] = '\0';
> > +	return 1;		/* Explicit module name(s). */
> > +}
> 
> ... strikes me as exactly the sort of thing you should never ever do as
> root.
>
> Is sscanf() really noticable in profiles? (I guess it might be: we are
> calling it hundreds of thousands of times, after all...)

Yes - benchmarking the change showed on average a 5x speedup compared to
the sscanf() version, which is quite significant during dtrace startup.
