Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB65248879
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 23:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749339935; cv=fail; b=S9gBqjJ+TknIZfQuJYifTez7HXHdKOoOSyZwIenCfSvArjoCPQUg5ZssBO5mxWiHKpxLB+0AFs5+odYGnNL2J6AIEREhq/YzjYSPH1Uq6xfFdjsH2rj4sQ7Er1Uf56GvhGHur//+Du9cLh4kDwxOWc3uMn5UqGsCfxV9zM2Jc0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749339935; c=relaxed/simple;
	bh=hphcSzvl6mBNUJxVQmzWqHl56DhzqbAxp3gIVhKf4BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uJLV0vSxBRHQwnoRFXrTR4AO5LD+Q/waiIeQ0UgyoJKfHVNZrKAvM6+XiWvUDM8fVAo51K3PtxNAEVTPtUGbzpfvISjqOx01QeiS9nw0Ho7snnLG5IMcIiD7jXC89XCUCWK2cKYl2HjJzNstEjooSBoUxV+LjMHKtKCIYRbSnEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DyfmBlxX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jKVoym0o; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DyfmBlxX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jKVoym0o"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557NhirR020640
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 23:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jqg2wonn8VzWgcOp5w
	VArZRV8VBP8KUz3ucG7Bi/tgY=; b=DyfmBlxXXGQUU8uxOjRGuaHAP/6IO4dSe4
	xkwFcw95A6IxgmZ9qOhqwwXfTBCUh09c5W9MpUFBtWGKkjCp7gJc/KgJ2Pf3IvJd
	KQafwWqq1Fy57t24bSwIB92LZvBb6B0zl37TWYk+g7iAfZLKEG0QX0fDS/jw1tSQ
	n0rbRdXYxe3saXyeuSWNUIN1044GGWzlH91gy8ZnyuUrW1G2haFvfkV92diKFeMK
	fRZk+vS/GJjXMkZJlkfzOibjdZeexO+32QpcsnpiKQPblELXJQPSP/HCcSjmvVbk
	08ieRz4GsBqeSwDk3g9pXtAbLoq4rh7uesOrFkETYVpIYuGr0iRg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf0hxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 23:45:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557I4AYh003303
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 23:45:32 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv68tb6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 23:45:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pe+pXWns0NxxAzd06L52QY09OfIrsBxPLkDzQCBJWNVe/OnZTtkVsjcSo2IrjoWiFe8hRRU5B4wqLOgkfP8QzFEac34Sy4vfTYZ01/0khwCQHCNvM07iIYgOKYYnM2/XgE3+bQYt1RiQOx9c+uk6qEft0anlQjF1+9XTpPPNzcqasiB52nEzq210cUW9sk+RDyln169UdClX467dHVJDFPDzA8nqL3H+hI+h64XEHRlfi7VuZMt73QF8oa8qoOb4MUPSyP2mgGRSYTfjZDSgk0XBi/0M1Mdkzy7P1oUdsFwW0c5n4ZnhwvE13jMnQES1ww/66LxXaBCtwzRc3OtTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqg2wonn8VzWgcOp5wVArZRV8VBP8KUz3ucG7Bi/tgY=;
 b=W6C2+cmNRPAVfQIz+cJsAb10A29aW3arg7583o1Rzz5AMwAwl8skeJ9w4efX+ZQR7MpdwZdOafKhFwondWikIAzJWemqqtVJrtaOJWEVOGEGzUSEFWwrM0yI2VWNcMiaJw94dYZY5HDsuV+TteW/+j3I3pZbT+zQ8joySxd5eKOhtIrjDroOyIQ2kX7no5nfq+xjQfMD6N0XtfH+xAtV+YPFv7KWGfXqYqLGs9ACyD2YXW2qY1rsCNINA3TSNOt/f2nNzb39W4COh0Kh1F7SNTlefrr0i3hJNGjUrfW2FfN54OQ1g1tLFr3k4fzfDxfsCoOeuE4B4ysjsDCFpwHTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqg2wonn8VzWgcOp5wVArZRV8VBP8KUz3ucG7Bi/tgY=;
 b=jKVoym0oqFdetn7zf+kqSS1U/qfMwoPBDH2LUPUO1oMGbFZ/ArYzPzcelgKlvI4mMNNUL1iGp8ZmKjo3d6BeGfLE6hKIvvQiklAL997XsO/i/L81K9Y58s0BkndMYICWAq3GRcYhjG+mngEZ3+A3X5lRIduJ3zgvH/Bnj6s4saM=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by DS0PR10MB6976.namprd10.prod.outlook.com
 (2603:10b6:8:14b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Sat, 7 Jun
 2025 23:45:29 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8813.024; Sat, 7 Jun 2025
 23:45:29 +0000
Date: Sat, 7 Jun 2025 19:45:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>,
        dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 15/17] link: implement USDT probe
 definitions in ELF notes
Message-ID: <aETPFoPsYXY75wpy@oracle.com>
References: <IA4PR10MB83741578CA0D3BD0A3C50511C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
 <87ikl7jsmt.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikl7jsmt.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|DS0PR10MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: e43903ad-1480-47f5-1425-08dda61d6254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BtoyhBz8jlGiqhnw61wnR+T+xMi8d1hA2GqMvUpGziKzg/BcSzkKMpyoD9PG?=
 =?us-ascii?Q?5bqxjWNJ3tS0Lsk3ZsmBvPAGXRuf79cC+C4sO4QiLa6xXXFBhoeD0QGApyFk?=
 =?us-ascii?Q?17KTuW0LpR789wIRhUp7+6ehQEGLHQhGTBykQCO5AjvhISzeHrkf/n5K3x4h?=
 =?us-ascii?Q?vzEjl96ZZCIqr4uy+49K654ncrviRFRLHnDG9t13TdAXLWm2lcNDTgxibtAh?=
 =?us-ascii?Q?TO1zKYGTo5yuPMqeukirPcaTOv6XbxVvmgL9+nOEaKvrNxnI2AM7QZ2DIPBz?=
 =?us-ascii?Q?8PSJPm6W18iLWyj8Wuccn4bKw/QqR2V+E7zqKPUQ+DLzGG0iR+tWsixTZKHx?=
 =?us-ascii?Q?k2LbVdJZ0MW9W3S+mjaAuWnsz5oI8pa56lCFyigAa13R652X60pY2Jr8XlWZ?=
 =?us-ascii?Q?mjDcQzO9s9HgMhwTHcPwFcs2tZBcuyfsTkuUDUOkhwKBEnAfPg8Z3clKdIWI?=
 =?us-ascii?Q?GkMtbstZ5jSfJrnzCZEokqw1aA5k7E30PTArokWHT2lmwHIS1wT+1UcN25dK?=
 =?us-ascii?Q?Nqe02GYR21hKW26rW4JCfvS4/cVaBoOvKPNqIQ4Ozk5xTDwXKjV9qL5re78H?=
 =?us-ascii?Q?TTTidz9W2hWAiWXDxcFZCqVOsIpPjZFmY3rBrW9xjy1ivO1eaJF1GqfH6hp3?=
 =?us-ascii?Q?xUKtRwI1/n8ohn4x8UEyZTwdrKWFAwMZ8wYp4ThhCmqVxJj5HucbHJBC2qq4?=
 =?us-ascii?Q?0eMLvWy6JP5Ng19NJ6b6G+EU69oYqBZUqBLX+8pCgVQa+RQhMvEDTf33KoQl?=
 =?us-ascii?Q?0XlpLOcjl2LACV8MGXpy195UFHcYxV06y0MHGuIpxzyJvvFelSgmoji//i0h?=
 =?us-ascii?Q?FXMb8lJFSLEftHxdxDiSYHw4HQQJ+Q2qFq4/6WPue4yu5ZvKkb0XeseEWG7e?=
 =?us-ascii?Q?DgVrPrCLaQEnFC+1Jemd3teKeK8+tELFjbLeulv+nPBY9upm/QrCtbQuiiiD?=
 =?us-ascii?Q?XEUYyyyFX+y0TzfaJmE7MgASwD4pPASAVsy1jpbaC+p5ryOF5EKg0grqT8Xd?=
 =?us-ascii?Q?4hL0IEwLUOQjoqPrmsbgjomZcM+in0XQWpDHTJwIr7VtsJ9J0j11NKiH8dC9?=
 =?us-ascii?Q?6lunW8zJ+KlI9uEXxDKp0EKR136btpyGJUJuda6ks9u4/CpzLr16cYHpmoCj?=
 =?us-ascii?Q?lqbZOYnNo9eJ3kjoBaxhNbM/Ywc58C9xAO2W8OiJ7JJoLLyx5x/g6iA5lEJB?=
 =?us-ascii?Q?+tTIpNwHcPsxpZvcLh9z0SoFFzuIgnvcgWL8fp8BK5ljpv9wuV6ceivHP9h7?=
 =?us-ascii?Q?iBKuKYqyDkmZDm6B46Sb4lpIcIxY3e9QdXszTDJx584uLO49H+J+1S0Db24j?=
 =?us-ascii?Q?fE0A6H7vF3cTLfYyjJM38oBy9jpWceKjTQ4Ov3FIsyWK2p+a/3/mTLnlnI5w?=
 =?us-ascii?Q?N2E9nYmM0kPnULJ4gZZ1wDoEgke/TmzObrSfKk6C4RPv8ryY5IrF9bMRdH31?=
 =?us-ascii?Q?/KBa6shczzc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+q5WB4mmKCRJmyoZJPEb0wazCM2K52+d65i+I/W2bYfzCNTDG01q1diLHAK?=
 =?us-ascii?Q?Ix+EOAgpVt/eBSZOrxH6j+pbARL0W/5dj3Pvu19lZUbjZL0ZCfmeRRAdMhCI?=
 =?us-ascii?Q?XXiaQZSaHGw3NZxajHeJPCEZWF5te8a21cOfuFk9aUoZsovuj1UywBrlbq0E?=
 =?us-ascii?Q?GncVBz9OrL5Uef9SrxOB0U6tliK3H4nwxdHeBDibJ4Ol72KTDOXFO+VYVYXZ?=
 =?us-ascii?Q?t9hbQW+h64lkKnaRXb5jVYa1AWjEouCkt3fJNmRwKg+ZLQx0NelJ0OyJ9dSN?=
 =?us-ascii?Q?buFSzzQOhvHEXc/+Hjiz3rn8x1ZMTuTtSD6Vz0Sfb4Cu0kshoU5XjaXJBqeo?=
 =?us-ascii?Q?6/cqBt67rZkOS9HUW5VziG6oRQhJWHq/oqjNve7IXyfz29WCtuIp9bGwMwEX?=
 =?us-ascii?Q?V1J+9sUIjWz6L6L1ZwA3Y2qzUIXWBF57ikmLIueF9dOTkASdW5GiYhnF8THc?=
 =?us-ascii?Q?XFGUCedbEBbJ4S5YAzrpr10X2jMJXZDupNtl0JRXN8xvNInG9XJSPDSJzOMo?=
 =?us-ascii?Q?OWPMasyo+0iP4nx+2Rst4RF1EBtsKoX4csY9q8fLlP+WWENIlkG+NGMV4Qpg?=
 =?us-ascii?Q?u35iUCiyrOMFYnICSQDGl+mRCrRvbLM8qlWGPPDa0xDcT79ES9mPqRjjV6al?=
 =?us-ascii?Q?dxxCCmIeM37ZNDO795k22Cfy/bVkvbljagQEjtbrsIKhma9QiY3zLeg6EX+Y?=
 =?us-ascii?Q?tDhLj/kDOxORWfbDhcjPUBvfaTPoUo0YILsQv7V4YhzTuYJ0Yb/oK89C6N+5?=
 =?us-ascii?Q?hR27v/SRW288+7zK1Nwdvp/QqdakA03QQ88n1hdBlLciCj/6HgMQ84N5mbxv?=
 =?us-ascii?Q?+in5JGf5WCfEWY4AUrQT72Q/Hr5ggxxDLfacg+JTHedIdMi/7yCtNzutp5Bq?=
 =?us-ascii?Q?oZpJqdRI4hXeqLY80Ffd8HyE8ZQgOynMV4ptY87ld+6GaKZDtghx2P5NINZT?=
 =?us-ascii?Q?N7TNvL5yXrOKdYEwS4ncS/r5Jn2V2r6oZD67TN2IqxyF1+iUXfrGiwzBPO36?=
 =?us-ascii?Q?eQJRXT/WX1xoGjw+RwApvBQEjQoIwdtT2OWBASXdfIeP4ORm/gxDcAslW1so?=
 =?us-ascii?Q?Hft/GC4468LPOQR8FgvoZ8SmRVZosdnIwviP9TRVeQRdHZ3aMM7+Wf8Etgw8?=
 =?us-ascii?Q?8n9g9voDFsoyUa4u0xv0fbOEfe1HPANsFsJ8Qysn+yBSnASGlxH2TMl5Rv5Y?=
 =?us-ascii?Q?lBIcs++ChFuVxaPhwDMpYYX7mFO6jYe0P3gRFq00yM8ZW0Z4w7Lht3jgN3PF?=
 =?us-ascii?Q?XgiPsRLwiI1XqPc0LggCpMP0/mTqqAgzzLfBM2M9bdNBpz4k4EKYewMTUCzQ?=
 =?us-ascii?Q?b/XFEI63FkNmPov6EQIG5S8NE25VA7w+Dzy8YpWnkrlbbiFowmH+meGsf3tH?=
 =?us-ascii?Q?ql7q/tsis47IOud65gBUNsWNUZbN0Js2+MIsw8v4jBBE13q1q50bPR9Ldf3V?=
 =?us-ascii?Q?oNOZMe5pl5jpkX9xPJZAGETIhesHM1er7ieOFNgk42S/RiKclM66se86raEb?=
 =?us-ascii?Q?P7MBYL3x8uZaweHIedS8omxsLdTQ54cLgK4zLmvz7fhLrTwEVTGmtOohHjfM?=
 =?us-ascii?Q?2aVr7xW2DL9R9aE3Ycb8xMKsF7PUNcjemqcqcSUa6gbUwdzxVaChUnmdiLcI?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xw7CzHrBMnMNVDuXEiFiy93S0m6ZQE3bOdFwcjpDyQbE2nCDxGttC1hHUABJVQ/TmSWdJ9MWti9LrECA17xwroafz/+8ANNG9YPmxUnjZKe8djZG7hp8mYOWCy3vFVRJEWvsy+iMtzspRT+6yz/AWuTlZAOlkRGK86ykBkEVYxm/oz4IXRmyfsNL9AvDCh4rgHdRhN8Sql+Fdkdv9P+PCLcoxYvPjPQ7D5G1y9qKZwgjoNbL3999qu6635hrZ7U4id7T4HPNHg3jByI3Xzq/opxLEwgndRiIrNTyVLHSpeVRYFWQOM6L8Ew6YqepxD8BWpmDxjzkTWZai926SNO10JzN6W4t9bLKWu8tB56YPN+B3MiZiMuyN4LLkGJ7Vz5pBEgky4ZrY5nJP695VZ1IVa9E0vybXgbkZql7ftv5bWzOS2X4SBBQEpR5EdxFYvwKqlEBvYiEG+rh30ufx7VhkWD/fUatYSXRCfqNLm26fxT85OpaKt309HEonE3p+y9+mWytRzPOni3E8ooD8hFl9JynwcOoz0I+RdSoInhzbLOLNapB3Kmj/8+am26Y6yJsgzWgS/WjV7qEnHhIPd0QkCL1kM9eRgRtMyVuPB/k9/w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43903ad-1480-47f5-1425-08dda61d6254
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 23:45:29.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWX174EIgC67QU83rjE6q1R3QYM2Jx9PozW0w64jDbCcrF/oGJ7S0/3Zs5ADvDQbanvyDoYFKkdQOiClCIDwJsadZ5MOdjfiMTuI1YTsNqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6976
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_10,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070174
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=6844cf1c b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=dsvEMV-f13aR8FN3suIA:9 a=CjuIK1q_8ugA:10 a=W8W4e29Vb2oA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: Cn0uTrk_KRDQxe6Q3vZvrpqFKtCBMfUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE3NCBTYWx0ZWRfXyEMZ4Tb2onPe msx23VQ6PRk490M7eEvvRDsn7um3sBSt9WQMQTBWIUIIpHRpLDLI7bbw6MLMHFaW0Wbfgib1UzN FupoLZnFL8kt6TP15VHsRaSGKRyij9NwD4pLoesIDkm8lh8SOKC3R1hIFsP6ShyfUDpd346ajKg
 ji2OwxST+H7ar/dzV1CgxLqJwcjVgSnzh8HZkuc5GF3h0mlF/xf3diatw60TTHu/3HK+GoDYSsa TMhtkdRbkXaHEWbQDmOyTpyuFl5ID0+cT0x7L9mwhMWZYvtD0SCB+OJKvnhOgDmNv0LBtCfNhUq 5UhemG3bQCqYaNRkEBZZFt2kIh9gwJAPMnoAdZHrhBiBWq/J06k95QXt0tlCYDaPHKBPjeFBOgK
 2LJu80wyCfrcmqON+1vzMktj6cZmn5VT11Ak9F/uQbYPInfIY+rYxU4Jt/+SRbwVH0El8ZNP
X-Proofpoint-ORIG-GUID: Cn0uTrk_KRDQxe6Q3vZvrpqFKtCBMfUp

On Sat, Jun 07, 2025 at 07:47:38PM +0100, Nick Alcock wrote:
> On 7 Jun 2025, Kris Van Hees via DTrace-devel stated:
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

Thanks.
