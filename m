Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72252AC17
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757855486; cv=fail; b=fyuA1CQzwNYrir4wd/XLa1s2C3aXJg4BirV9t5dZadmHqd1ZcoH1Lso2WTnT7hrBOMOGyoQkPRvlKXqPuxS4P33oNB+cPf2htJ7ATQuST42FneW/UaTdMgeprTLAdHIdaD2Xyrcj6pOEOJmyBzPA6/B8Qok5tUbFghnusLT5Mzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757855486; c=relaxed/simple;
	bh=OAPMXY9jsDsv+e+ES8Aj3mAwFUpxiGTgRvS3yQG2chU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=JO7PQImYU/10EFMqgowrO/7azOJQvsQztwBqwgWzmO99QQVk2g0+00jw7ejUho5bKQUNUdS7s4E+nUWoTVJdxCVpTTUkfC4lEaWM+PxjesWgI6Po7rww/Ws0/lFAifdjHY988FzwboCNEAhLYwUbpWxl7rUz2OUvyrmCRrNTIL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SNG0C71F; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MQNMmNNF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SNG0C71F";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MQNMmNNF"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EB5YkH030700
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=OAPMXY9jsDsv+e+ES8
	Aj3mAwFUpxiGTgRvS3yQG2chU=; b=SNG0C71FmBkudi3dQWEzqkH2c4LjsyQ5Us
	Clz8i/+LRMFEXyD236/CrBYIkrcyMeTiplAoykUhsCL+qBjssjyDp+hog64dEfO4
	P5IUEUyfvLz7P4JKlq1ETDtIcG1Q6IH/KI4xB6wCH9+DLQY6c8WIphPHLqf7uJzR
	WK1z5jSgIUD+F+YHhTg8Pi3jpdtKSexRD1S2goC0HX2jsfje5tcYsc6/immQv4MU
	7Ou2AbGqbITD8GKhqQaSUmc4ay8dv37nJq30zBNdNDel5U0sYq4X8YnrRUWRvGCN
	5mo+t3ezkUghTV6rrTVH84UMvYqByDGJ3ZREYe1/vbz50VCEe+4A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494y72s12f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:11:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58ED0JM9015358
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:11:21 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013037.outbound.protection.outlook.com [40.107.201.37])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2a4evv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:11:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/q1s5gIs0QRmUH2JwuI9p24euXrh32ErWYM1FUrIE4WS90fyEDAxmklQGVzI+E1k400z9reFt5V8L/gyjAIaRxIMQ+bqstOihdWp9UGEDM24MnSVwH4wo6q06EcEDJ5ywKIgLVYlFRMzFXIy6wcZTEsvHdBFGw6qQzsCl1kc0mR+Ik0Xxnz0cA3o3qTaA7UH61naaLnSiu2WIGR5BPlFEpcTuxs9rmEv3Ra85s+Yt5ljgE1dGr3tPpjgktsGGi/YxJHCiS1dRght6jiymNTwKr2mk6QTAi6kl6yLUeODVlhtSRvmNP9tlC1H9MlcSf/x6PNAQtTNAyy0GOkNRmNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAPMXY9jsDsv+e+ES8Aj3mAwFUpxiGTgRvS3yQG2chU=;
 b=N5Ou622OEVeib8XU0/UeCfnLtjZ3NQfZmI+GHEFPNQo8LRBst0L7dZGbLGk1NYKb+jJn1KBh0mZcix+E55fkM+q8UGP8Du8pA3/YUMt0pOwzo1IAUlYmDR8x0T7TCpjPP/r375TlUyYWZH4g+Vyg9d3+wRz/HNbb4fBoqNRNxejZprhfPOOfpmqu/oJSmFRXSO/sJjcQ2o6Pg0q87EpMG5DINud5XXDR1qvbMJnqQLAsvgI3v3XXyG2Ph4PPrSYjqWe87s4Wu/OFIZRd4E8ETFEmmiwqv5L/Mx9atkA+R0xZnW781Jryhf+QLEB6HwUlwKfu4NZdVx4uMimR4zYUJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAPMXY9jsDsv+e+ES8Aj3mAwFUpxiGTgRvS3yQG2chU=;
 b=MQNMmNNFoAvx0UpZLrmFuPfCQYhoCFObdIejHrAvIvfUXv+bPvhQGrGqcvKm+15/D948qEheN4kFHjV+E25z2p/0zIsAlLE9fIvkDSeITl+7rtlh8XtXS3zYddpdKVA6JKZin0mKJ1NyqfV62uLK224RE4ICOSRY0Twozoo23qU=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SA2PR10MB4681.namprd10.prod.outlook.com
 (2603:10b6:806:fb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Sun, 14 Sep
 2025 13:11:19 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9094.021; Sun, 14 Sep 2025
 13:11:19 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 1/3] Clean up unused argsz
References: <20250913155619.22299-1-eugene.loh@oracle.com>
Emacs: a real time environment for simulating molasses-based life forms.
Date: Sun, 14 Sep 2025 14:11:12 +0100
In-Reply-To: <20250913155619.22299-1-eugene.loh@oracle.com> (eugene loh's
	message of "Sat, 13 Sep 2025 11:56:17 -0400")
Message-ID: <87o6rdw55b.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::11) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SA2PR10MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f154d1-c2d1-4d9a-ee71-08ddf390319a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SrUV3TMLXSGayKNE0E2daMXiG3r6sWqSDmzr2P6wTMe3I2nBo6pwr31SBMmg?=
 =?us-ascii?Q?27tSjQhjiJfE8oCK5SxZ/f7p4tCRHBeB+x5eUFF9+trIiCA0FzBdvHZzhypO?=
 =?us-ascii?Q?PFOqrYMS4QjX0jCV16pMnY+bNsmtJzDcgvB2OimgIGFkBrWrT5HKyCiX/I90?=
 =?us-ascii?Q?TVei1mID74U1WYRmErFqL42zOxAMlDTUziKRohjalFTfPpCYAcOZect3p7d/?=
 =?us-ascii?Q?YjKBIc9QCBpA2RvQMln6Rz6/wvVl2p3dgIGTre6soOP3t4Iu10Zd+tu+/idR?=
 =?us-ascii?Q?zrglaS3Qd2eeI+4UiFy59VySbbcP86rGhTL0il389YIRXKTdG3JIpbJi9R0O?=
 =?us-ascii?Q?rvOblMf9vfbDk88IdVDSVgM4mGLORC5ZcJV8PVZmJRg3rhHod+MDiVp5aFvr?=
 =?us-ascii?Q?LnqzTRDdOhYaNgKjPQvOj46Fi5MiGVeyd5KEMUSDZorO1Z0WOjvtGVPsxnja?=
 =?us-ascii?Q?JeLsKXs+GS8KZ0POfAAZ7B+XlrEFmmT+83TVTnHpT9Dl1Smr4AZoCV43sXfT?=
 =?us-ascii?Q?cTMq+h1/G1KxiF+BGM5iaH9kWg1ZM1BuewzyA9Fuv5obxxiZyNiFaPJTH5+j?=
 =?us-ascii?Q?8yGoAjWOet5p3eudvIQyiqomU0TuMmd2lAg1Q33KRVuw/EPtfHNM5a/e3Gx7?=
 =?us-ascii?Q?eDSxI8e5ZxT3mSplzoGHL7ObpSPgwGzV0BLe0A5PP4v6f4IsbGg0CgzXTNmF?=
 =?us-ascii?Q?7IaTHwG+1GijF637izBxGrJvJsm4zZ7F/hcMN3sU8m7ij082KS0z6/Kc5c0w?=
 =?us-ascii?Q?gr+bn8olj5l7jw8Ds5fO1Yu0p9+VTw5xu2u97+Fz5cnXOpphzusuY+MtDAsg?=
 =?us-ascii?Q?EYY+qfioVQvgoIo8DGew4dqjhbcUTPnWg8gj03nJIStCuDyfMwU3HATR/yCP?=
 =?us-ascii?Q?LnrgsIT/Zpcwn/yfIRcJFjwxFAPU/yEB9LqTgxzMJxga+o8mdpnZaH5sckjE?=
 =?us-ascii?Q?rO03988DWkwvdntTDmWPAQLRoHjR+Thyb5hMN+NCKXGGFd4WsC56LMtHoWD9?=
 =?us-ascii?Q?shilydFHSS87jy+viQnFeCoxeyhrGa/RQV2p8wN/17+H3nVNlJKjHHXZ9OeE?=
 =?us-ascii?Q?zD44TxQ9r+jGAyX93gCNEOtmeQ7nJnx8Zav8NDLz/usIS+4GaWJiUSArtZI/?=
 =?us-ascii?Q?HGrx94yJR2TRB9AldSZ7wpsqWTCsw3lK9Gt5R/kQ1RwRq66XXKmPcn/myt+/?=
 =?us-ascii?Q?HogKgf++2rkloy85bjGxM/pGRmxn/8K0y6sZgRfjtmxAbKOJErwi/DR88WJH?=
 =?us-ascii?Q?I+Dgrlx4EKWqRRnc7vOaVjrYrTO+l5HBSfy/yUeXQIM8hmaMGLAkXEbYWRot?=
 =?us-ascii?Q?GwTLpD9NotXvRpsaQqJqf11MvnPvaHa40qiF8ubG95hdKIYjdq5Zx1Q/QilL?=
 =?us-ascii?Q?565U0Fm5esh7ETacVnTjkUCxFN8GfW6jbOlKt1QmOoDvFbt3HcvrjIR55Sgo?=
 =?us-ascii?Q?E7q6MjivM6s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gRiW1Fud6LoNxLNOZmciSrb3oLAwx1qEAVnGIzMLe8AdVtlXpSxadFoDG6TS?=
 =?us-ascii?Q?ly/zJI9KvtrUBcjcx2wOXV2auT/lDRr45mdIHM+Zvz8L6ndNBmDDsgbNQXzw?=
 =?us-ascii?Q?fLY4YIhq/jgXS88bndR+gQmYKYzRkI4hykBm53XEqFdMcKizpJltF2vHyfAf?=
 =?us-ascii?Q?J41RGTubRHPopHA1TfW0WFgyWQqp5vlCh2Boh7Kb0ZjSZij9odSbdT5PgniE?=
 =?us-ascii?Q?i95OxA8SX8nsB5pdYdnVj6wWE8rx3+zlhLOQWzekXLcaF7TXlgaHTVrBq7JL?=
 =?us-ascii?Q?CMFhFv+UHO57KB0mRb0DKKXNSCqikMlOYZ7TnZhptaL7pLdWUj8yEKt6PFOz?=
 =?us-ascii?Q?kbaQhvOVVgTxB+xnH0hXgIlJi5Ad/83e5yysv223xA93NkKXdjrPLK5/M51V?=
 =?us-ascii?Q?zuKshARy6lW4zKsdGFMXClUKOUeBfDXrAl8MBdnJ9AXeQj0IlCZcD/edSI4c?=
 =?us-ascii?Q?jFJAfBJRfgWXijMkEaBg1qdeR80ETZV0ggQ6OpzWW5CWo575Hx1Sh4h1xyjN?=
 =?us-ascii?Q?4fODTYeDUzz3wurSIvLw6WfxuS1bFUcYRTBwouVxmAlnHVQtLdttdgsA/+2x?=
 =?us-ascii?Q?vgu6DMpuYyUZVbpyjtXNKa98YE0izvExfPib3yc1+dCYI4s91XIfS5rY+QZk?=
 =?us-ascii?Q?oVCOF7rw9xAuQ9QtwuEKW4+pTMZmiwQ6YrNoGofJG5ZN+kE5fBx0PtZI4xk9?=
 =?us-ascii?Q?Erb7e2TKCvdHuUkFhOWbX9rdxABJsGd6wmgviAzxcEaO0Og1atf07+GrI34d?=
 =?us-ascii?Q?F3JkPhq1OdQRG7fBt4AOwZUkJHDpaVHDiTGyWl9HNMNEouakA7owA1paNFZX?=
 =?us-ascii?Q?hmWNYyTUiqafoSz9bNI9RuGjao9R9uKTSEz/mKyyCwQITU6VBw8R2n22KHp2?=
 =?us-ascii?Q?Lobp6iwP5JpoJWM7I8TQLp3any/gato/34ZkIcBunD72/e+AMHMkjjryrRSY?=
 =?us-ascii?Q?9scC8fBJxT+GvoBRC4pQerkB0cMEc7wPmWoKktZvvGR8ZuhS+zgUY50xStL0?=
 =?us-ascii?Q?ArVbpCUtBO4xR+b//n+afV9oEmx1GfandxKSno++3aJurV/2cjBOZPlI+e4j?=
 =?us-ascii?Q?uiY/BBMIW//HasLGENPvZb2J0cC23bylJm0/VqGuJl0OwiWwZtZZE9OvJod8?=
 =?us-ascii?Q?ee53Reb+JhBEKcMWmqRXIA5p3zpwAFAF7y+UUUwRaAm6FG8W3xS+6HF3ICz+?=
 =?us-ascii?Q?W+fLhfAv8euXGLM50ckxOu+NPuaO0LjnoSQJyrzOR9f6MbrlVF10B+WQlYka?=
 =?us-ascii?Q?QemWorrvoW+iUWkxvfrvPVtL//0CwCRyNE2fCXIGUpC+ZCmzJjmhm3CoEhvu?=
 =?us-ascii?Q?OI/4zLNUfj8K4p+JsZKy4sIL7xS1xzMkVV6EycQ8wAXb+7RkNlmhc70d0QbF?=
 =?us-ascii?Q?6Nv3H1V+bOz06STuizkMLNpxp4q3x6CSb8oRD+Vg14/T52NLD7Kq3WuWBuSn?=
 =?us-ascii?Q?jiZycSXVmPDGaF00iK1V6wtqk1P2mcS/aZ+9RVQZswmgxUlcc2oS4M0nAdB1?=
 =?us-ascii?Q?LwiuZS7zBMEi7IerkeB1oenW2FqUFCk3LOCTIL7YQ7duSlYyybpeQbM8Eq/h?=
 =?us-ascii?Q?Ou6PMJ4/tAq2rQW33l4XJ+WvoMNjoFjoexHioYL3YLxSljZOpuRtXSGbadJH?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vM19kqdf0PBBgcjdyxHDsWSHyvcClz+9gWBmjJFCbvQkyNg46dZtwaE/ch7YN3KGYeijgnI0f5VISQ3WbTmL8XAZ4WRn+4v2tYrLHnyD2/QJ4Am81CEwCPk63R3PiovmkBFHLx0OufO6uujR7lQNjSPmkVaobDCFEYfCIE0KJBYB7iwGqKgWLh/2x5cd1fHDTfR9iewPsW6oLrGrAynaRuCkksmHMcYLC51DV3ias0PXR1edn8/B0hjfSe4FceFHdiNJUqjaV7OtK4F/d61i2x50zNS/jPjTnAPCl8B2ilyLLnjyYEcb3D2VMas6X5LYM7k0YqvO6a/B+1W9TjTjE17NBZBMgo7m/dO94Blp9EnxkFfzKXhYiABrgkBCRX6FTlWum3LjhMSmVPrdwmqA2T7OIM1IbvR28bhUSVbqVvmFu0bLEbZDxJRihhxSYNRyc6lKqi7mjqcoWG9JP3IlgWHf66A6Q67UL6BnFVh3GUVnS9joepuG0bvTrQeupCP2z3/MeMEemyeXdWMLHMkzrnL0jlGnBVU2BwEophR4zDIyzZuTpa9I/G5WUVsYoPFj984MSxQKOCo1YA2Wl/MQLH7lJSLIi1ubZLbE2EgZAss=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f154d1-c2d1-4d9a-ee71-08ddf390319a
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2025 13:11:19.2103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxuKurRyWSY8b2xjBVgvUJgRSyhFUDnPYcWuSQP01rRevq8VU7QCXy+Ck5AY+7Zqh82TmRo1hs0GTx3dVJpT+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4681
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509140125
X-Authority-Analysis: v=2.4 cv=F9lXdrhN c=1 sm=1 tr=0 ts=68c6befb b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ttqUlfu53Zy3l2AAJ6wA:9 a=bQS9OzEy0soA:10
 cc=ntf awl=host:12084
X-Proofpoint-ORIG-GUID: xRGgezxDmX8b5-CrB_W7OKpTj2RLnuEo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMyBTYWx0ZWRfX1KcFVDufQiRQ
 rBiGvQ7m3feacNUA+5kekuv5Vn0aUE78QqzXIf93l+MS+JKJ9V4S9hOdNQLRE1n/540R0RPYuWQ
 ExBL2+AwwvKV05eqexv5Y0ENk7VGlPEj7MV6X2RltF3fgcDEnMJuBld4426WXXTMCYH7YXitNcz
 V6KRnmwE77Z4ODQiXPITsB3E0tUQP837YlCOPNih8M3x1fd4c4ASf9OAExvcTCDIGPqZcMqi0Gr
 IogOf7CQKj2FvDlsOenLI8YhCYAHP9dnBGXgSzlk6v9421kL/LBpPTqSa97SYW3FQddK3h8cLys
 koOnMccWvHJOUZ0Z/HyjFv6nqs0sALmNMqk21HvVDBCcESfGy7UbzMTesbSBo7cVGEzwVdVMxci
 JjHecRRzJM/hZTBXPcNfuuLfLNwMzQ==
X-Proofpoint-GUID: xRGgezxDmX8b5-CrB_W7OKpTj2RLnuEo

On 13 Sep 2025, eugene loh stated:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
