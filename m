Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D21D12EC
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 20:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729715322; cv=fail; b=bLmjpTQMJvh6cXCfk83vdpYJZZALnD6eDFZPbMxRXMW0FPIstHR3GODE3oFqnqT37YhKrcwjTawzkmlhZJ8U+GNTQsCGmZzqv5iOXb08+Q7bfUls8d2ZSt1GTECYJZ8j9nRr9QNwwWe5tbtydCyUOnCGgVJx4CfRPaTl4qYPUEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729715322; c=relaxed/simple;
	bh=YjGvczUHx4JJPWDPgqALzVdtA9ySzMaOdtOQVT4I6E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=phjHs4X8C+WZMEwevVVGBLm4Bz9ie30T5DqvIPLF9pWetEIE558cH1D3Ac7FnAT4DvoBLxPyXCXXOm7E4qRHzq4OGXoJO2y7o39Ogy4J0nKpMaiDTDN17EaA8Y9RJ/A33SLAtPDSzu4Kc7tYs2pgkKp9icUykuxZYVmtZIScuMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IPhifTZb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AYTbgGNi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IPhifTZb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AYTbgGNi"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NFfixJ026770
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 20:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Pa8d074v/UwD2CGTtJ
	NeLJq3bQ//MHTEJ1EyPiXmYRs=; b=IPhifTZbjrh9Ci872l+vG0OEY0JmtuH2oV
	LWcA48aDuwsu5pgabDt5T8fkmrY0ADeG/kI04mNEapFYHanIWsFSRiebNRFeQrva
	uCUUsO1WPWIIpO9gEGAywJepa6hDlVxUt64rj5t3eJqeS0Qnb7RnJzyGdyWiAUFm
	Doc+upcUUBZ+w95HzsmOHiwVxKbvfkougMMV1Nk6PKX5EYvx740Vr/L9KFIXA+ql
	2l9dHzpw65tFW4AGTgt5wFgFWgQioZwJ3/f0I3fZqf7nGQsOqZw9GvYm3LzI1n2d
	RXI460TWO3uaYSxHQYMhEgLAiPjaqEBc7fjrrTeE1iXCL48PT8YA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55eh0ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 20:28:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49NKDaSm025622
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 20:28:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emha0yb7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 20:28:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbhPf5GWIpBz9GvQBN3NeVXPmebNLL+VoIDR7Y3cL/ugbbCrwRSholPUQBKvCeiE5dsWwD6PjP1FFzrlsYaWArzuJr9j9eRQWF9wl6AEDuleF2MSd5el3HJ5VCGtZlmObIohyybDHHrs6adyfS5UXlJWrbplnoK6p0+GwO0lDgE8cTmOxxgum6wxxWSM8wL22P/IykWcQ7SK26WE2sw6VGjhAkasa65yfI0/8cxJYCG80iCCkX0JW617+rm+ZdQaueQOmZGN9fD4a7P63kyB4NGsmj899mENrgl6r7dJXiLKSSvHJ5wBHpJIphkm8P/zV7qVwfDNgBss3dbVlegL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa8d074v/UwD2CGTtJNeLJq3bQ//MHTEJ1EyPiXmYRs=;
 b=mW3V4zkuboWDhGrIe2YSkABlhJVYPvF8AJBkC92GnY2Vd5G3/0S3xAhp9NbheF7lt7zLTe4/rED91Yvtz0+Av000py3tEztTiEhLm+musC/PmU5Nhk1OyqMIhQ6bV+ovmOjeJeVYbuJH7hcIPQ3fxlcfea7dwmpsh6T3keQ0ErSmdwlTfskdbvy/4GDSaxpD3DOl4bbztmTlyxlMZLVeT3w9wMCvnZ1Sn3ShIPIMEGGisN+iVerEXea2PA7PhKZvD5TG4XbtYFe6Uj7JMAgRCb0uQyI85rvqAGHUGff9yjVJOTbNvh2CJjeYB7OxHqu7Bq12ovRzTtAvCsDPq6gjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa8d074v/UwD2CGTtJNeLJq3bQ//MHTEJ1EyPiXmYRs=;
 b=AYTbgGNiIHegqa3df8EBkT4aWX2uZdtz3SrmbIoHWCXSlmjxm9y7njmCLEom0d+W/lqV1QJ/W2FiLGx/8v0xN6XhaDYK5ctv8vW7bJ9I8ZqsYF1MxdHEwm2Byc1xOZP1JzZ7FVD9lbRsA3LaqVRapiumrT6L54899bFYNre+OVY=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by LV3PR10MB7938.namprd10.prod.outlook.com (2603:10b6:408:217::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 20:28:33 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 20:28:32 +0000
Date: Wed, 23 Oct 2024 16:28:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 15/19] Ignore clauses: some clauses are impossible
 regardless of uprp
Message-ID: <Zxlcbjd4QSoU8H+T@oracle.com>
References: <20240924202554.7011-1-eugene.loh@oracle.com>
 <20240924202554.7011-7-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924202554.7011-7-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::20) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|LV3PR10MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e55aef8-327d-4843-7f90-08dcf3a14383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9qE1aCJ1MzzrXFQJkPLve5pYbgkefXSUYf1YqW+wO5XCBM22ysnrZTGYXG7S?=
 =?us-ascii?Q?qoIy63CyYGnmRM5f/DDWubIPAqiEY0lFmGeHKocFInvOh1x/C9OJdgIcIWed?=
 =?us-ascii?Q?f8IoBbXZxIfoynKL2o+UMIwy76duw6FhyULCfFc5EkzwkJ4VTnxpYW4gzrGB?=
 =?us-ascii?Q?2aqRQE6h/KZdDulp2ZLxc5EZcfUkOr9Z4yzl7ARyb9y8N2qCZJuohXUNOKf6?=
 =?us-ascii?Q?EJ0VOCEZsTgyUcHhZ2yUmzz15FfsKpZELPXZZeTTogsQHP7ejpSerK7YAgPE?=
 =?us-ascii?Q?BuZKVv0flIaTrOmgSY8YRPVZPKy4WAVfDh5vAM3suUui1MHxOLOvZtlZSNS6?=
 =?us-ascii?Q?HY251z4yi7dwxMRd1FZz+qW/dFEgRJukUlZwehonSPnjuXh0qpnNitDCN/KO?=
 =?us-ascii?Q?ABvgPQipFgFHyjJpAQN8zv7lVz6qKQdsTOUECUos52F1xpkjmPl0nSyYfyXn?=
 =?us-ascii?Q?4JpSkxVimE5EiIII8o6VJSRwZ7gN32nFsgpQBNOk+5fX9A+s7ePrO1KC1O97?=
 =?us-ascii?Q?NJXWdm2t53l5691wzg2ZT6bXyDGXh7yTNj4jTh76CLyAB5WAdgJl7OMET8ES?=
 =?us-ascii?Q?KrHJATmhbWYezJ6QjI2wlQAcxNFlu/TdifASJpCnIy+jSJpprdQ5vMWRaZpG?=
 =?us-ascii?Q?lm5pXlF1L8oRtbKHGXegb9HFedmk1XuE177ZP+/q4uOZX4M6MU7gTxUaFUvX?=
 =?us-ascii?Q?7tH+k3tyAQoIZQif6oz6/fYOfNFFpKoTpSslJFKgmpWJhyUzbGYhGrAPffiM?=
 =?us-ascii?Q?S0RlondLBDJi0Ab+dke8Ga8ENaz2Eg4D2CrcirQk9zg29eDrrGR1ONFvc9fC?=
 =?us-ascii?Q?AdtP3Ur03Goc0EBLqZ9KFrjUMS2BykL0hrTRcQE124KMnBaLxaD0MQJpHhLO?=
 =?us-ascii?Q?B027lKXtZhXWWfcbLp4EBNujQvO52OLpnhuz9LvAclGiYKmTMvEb2DbduoFK?=
 =?us-ascii?Q?cCYxhN1L5aGV7QKP5OrNHbt+qlFERv7btlPoAySk57oLZeI5bhN2iwapuvIm?=
 =?us-ascii?Q?fLiHr+CTQVvnsrZmYvYXTg4dmhPJFDJdI1DWkJHOtdwICyDRa/CaiXfOVQ5m?=
 =?us-ascii?Q?WuH9g9xGQHLiJMGOak4yLLooZ7jC8IqKyAq5ac6qX5kSK3iBzaGM6cGOmmmy?=
 =?us-ascii?Q?gRyEGx/CsmMbYFG/eHidKAVCa1KwKKrqZrSRNTxf42xjqjarlczrBJ0A2mUe?=
 =?us-ascii?Q?BVdxfEdd7zA+pqLbmGD7JRRjaIKV6KH2Bh1N3/AjKVtsiqBnQyk5b26/XBSm?=
 =?us-ascii?Q?PQt+WU3eP8OyKR0wPnZ97GFYw3TJx/i+Qi5Hv4dydAQHk7HPzbyYOAsRYcO+?=
 =?us-ascii?Q?ES9n1TLFDYl2/5XoyUBr36Qo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?85sXc4b3P9Y9Z3gCY6EklGL50qOGoonp7n6pFL54O7Lz4cU3l+eZsuXymuSX?=
 =?us-ascii?Q?MC6svxwVwSX+ZVAOBzNVuaV9hC6exOgFg4vWekGjSU9xmZQCWod36kq41QD+?=
 =?us-ascii?Q?5shiiQwkkXSWmQOvqCVRICctWypsQUt1ACnG1blcXiM+9079/ftqtUijPniD?=
 =?us-ascii?Q?R4PkW5svr0QNoceWycNrEWAUDJ+3AFDC7mDiiDAot2v+B909MIZ9U49SFW75?=
 =?us-ascii?Q?bo1mFLWRRKO5so1XQqeKpp6n6qOKkhr7owNwLBDG90Jdtrh12WN4Sm7DQo2y?=
 =?us-ascii?Q?SUjFgDRCxvnNikn0fAN8vXT2j4OnE4wGfNs8uzwtsWedKhpA89a5ywfa+kVL?=
 =?us-ascii?Q?3aZjgHIhOltg2zr4NTuqQfSMsZMLSr4+RqXFmJOMPQd3JaiyVNKUOls6neRL?=
 =?us-ascii?Q?rtahI95iiPvAT7GOcXmbiHdVRKt1eCfrb7egAshw4WJCGtY0Tj1J7TD5DxQT?=
 =?us-ascii?Q?P4r4vF/HN7JGKHs6uu+NdTy//WYKklGrKGuYNTXyd/Oin/gfocm3eiJgj1gu?=
 =?us-ascii?Q?9gQOCYtXRasDVNPYh7VyFK5+G8/WcnFi7JHV2YqG/xXBmzQWBA+eVbdF5WRt?=
 =?us-ascii?Q?bvl17+4djQjBJkLovReiB3EwNsHqDkaIN//dFYPRsDG9zURXrfZatu8pJZbO?=
 =?us-ascii?Q?OTQDdDp8Pat+eWxGPkfcLguKNgQaRUhhO4lYWinL0pCZA7dMZ4+FvxXwpucQ?=
 =?us-ascii?Q?/jwtiT8lICMw1OigmewwOOfmdtAYHSH3GSWLI1cripui5iLtVJcMe1CXOaBo?=
 =?us-ascii?Q?3E/rwLPWVhBxuPG6v4/Zzt27UYywvfu+iTylGAKADSM7W446ObEGnHfoAxMT?=
 =?us-ascii?Q?AgbzkSrjuwnpIZjHJB+ePuYAnPiehjdmUTpxZI/vnTKnYmib1FkzEwL+Wj8a?=
 =?us-ascii?Q?JA3mtlZ8DHadi8FBZXxqZl3fGUdnnRN/Sv+i811dLTB7/XBqc8lsvFeg7fXp?=
 =?us-ascii?Q?aketYnosQCH8MopB0vCHUWs16jrkzKa4qA9umao4AUa8FqS7QNkeLIz2b8OD?=
 =?us-ascii?Q?1vz6KBpeobds20H9O1IHBonQ9yM8n7C5YQdyHJAzAqwYKKe2/9ZcpqtDVK8x?=
 =?us-ascii?Q?I26s6cFI8ZPchcyFmKZF6b/NzQBLCeUaRHKsqEgK2si8O4hdbw9hBf7rUJnF?=
 =?us-ascii?Q?WDUwdQ6ZYMnJIu5uiftoGHER61Jt++5J0u739dTtb3rhOZ1DkpQkM1nkux6T?=
 =?us-ascii?Q?M+PQ/Xbuv/OnFGxLZDUJ18n41XKZoZNDSOmWaCgfbavAT3WEVLkxa1eyUHdF?=
 =?us-ascii?Q?JubJ8QhMAB4ZyrxznvTeKXZAjW6orh5DrIduZKxrPkJU4Y2GBZJzjbEnQiOP?=
 =?us-ascii?Q?Om5HU1go/TT/jDIvaS5kpVbrCLJWjD8iyuRCWVCRK3DaLGtco9CDWZUMv29C?=
 =?us-ascii?Q?sRCmNaamghZOVArhXXICcQ8Siezuk2+mkRmkgpsQwvrg+K5vLYMLo0AprwUr?=
 =?us-ascii?Q?feY1/PtlQPPcrynh5SDMpaC/aubHEPbiEI0HGujki1sZumaPomxsPayIYgKo?=
 =?us-ascii?Q?zUXnN9LlDQjkWNJSoBzmzhw2L/14oNmMvsNKHPSE4R+2MfnX2U2B2aEgNvIu?=
 =?us-ascii?Q?ZDoY9NvvTcBAYkOi1AemoYb8HX6QcU1Am9vbPuwNEZawUvfTL4o+maspQ2v0?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6LJyoeS4aOwrgXjtlglHwVPZvnEHJ1eBGMHymlOIu5C2Vjpi+EtUeYVZWdSsxWsX3roOzi318zD/4lBhevXW7vWZhCzFPhmesa5kSYI/dN3VgjKZENQkLIDGjCtk351na5Bi224xrMWiF9wWVBowvlFdx+s2I3aBojG+ZsvLj7sbs9xMfzJWKNQwDTButQd8SfFioRgQ34VNzFtUQQowRPpiT+yvJRZWbhJhQVWPbKzduLd4d18CTPbmAK+WdBz5WlgpJoPVqrG9S1mDmWXbEiDofIsBRSSmmDF/N+S+JB8nPA3Z2WzzhjtCuTP/P3tMuQWZSBO/Gh6KpwzlABNx2MrjIeYK8+v8py9RyuFMaaLS4b7tAgk28xRJTFKcry3RyCq0B2Y7cu7BpwEj14wzC6v8ZDT7iKEBk0bd5tfXK70ikqwrbd12UjfXpWd5x88EA28hYwL9gQy0QD33xNALl0iW80S7H4DE9HbVEZ1wf/4wZYWtrPMv6wvB+xUMRGZMH+PS0CFkFZQl8L0RR3Wpu4n+iLW2kV4jwsHfZvExNeAjPAaAvg6fricPIB9rYBXC8JV2P2qkIaEf89iG8wbwFMHSdnDu21ATYOIF9AKkkVE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e55aef8-327d-4843-7f90-08dcf3a14383
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 20:28:32.8969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqZAduxgoKEluCNn1MgOOjoIwUIlGWs3Yj7lC58uG0K4I0M0hTUX/VpsVlBrnQc12WFfPZp5ogwNTSSCNiJw5gkpZEAje0deAIUKBcJDOn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7938
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_16,2024-10-23_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410230130
X-Proofpoint-ORIG-GUID: ulQ2TyazYNvtynNCqsYXP_scY9FWT0Im
X-Proofpoint-GUID: ulQ2TyazYNvtynNCqsYXP_scY9FWT0Im

On Tue, Sep 24, 2024 at 04:25:54PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In ignore_clauses, for an underlying probe uprp, we try to
> decide if we can safely ignore clause n.
> 
> Meanwhile, for some clauses, the probe description tells us the
> clause will not be called for any USDT probe, regardless of the
> underlying probe.  For example, "syscall::write:" can safely be
> ignored, for all uprp.
> 
> Add a dtsd_usdt variable to each statement to track status:
> 
>     USDT_FLAG_UNINITIALIZED  not yet initialized
> 
>     USDT_FLAG_POSSIBLE       clause could possibly be called
>                              for some USDT probe
> 
>     USDT_FLAG_IGNORE         clause can safely be ignored for
>                              all USDT probes

I think it would be better to use the dtsd_clauseflags member for this.
You can add dt_stmt_set_flag() and dt_stmt_test_flag() (or similar names)
to set and test for specific bits in the dtsd_clauseflags member using
DT_CLSFLAG_* constants.  You should be OK with just 2, one to indicate
POSSIBLE and one to indicate IGNORE (neither being set obviously meansnot
yet initialized).

I don't really know what symbol names would be best... perhaps for now use
DT_CLSFLAG_USDT_INCLUDE and DT_CLSFLAG_USDT_EXCLUDE?

Main thing I would like to accomplish here is simply to access flags on the
statements through functions rather than accessing them directly.

> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c | 56 ++++++++++++++++++++++++++++++++++++--
>  libdtrace/dtrace.h         |  1 +
>  2 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 51ad3b55f..938c5784a 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -27,6 +27,7 @@
>   */
>  #include <sys/types.h>
>  #include <assert.h>
> +#include <ctype.h>
>  #include <errno.h>
>  #include <string.h>
>  
> @@ -232,6 +233,10 @@ grow_strtab(dtrace_hdl_t *dtp)
>  	return 0;
>  }
>  
> +#define USDT_FLAG_UNINITIALIZED	0
> +#define USDT_FLAG_POSSIBLE	1
> +#define USDT_FLAG_IGNORE	2
> +
>  /*
>   * Judge whether clause "n" could ever be called as a USDT probe
>   * for this underlying probe.
> @@ -239,7 +244,53 @@ grow_strtab(dtrace_hdl_t *dtp)
>  static int
>  ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
>  {
> -	/* To be safe, ignore nothing. */
> +	dtrace_probedesc_t	*pdp = &dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe;
> +	int			*usdt_stat = &dtp->dt_stmts[n]->dtsd_usdt;
> +
> +	/*
> +	 * Some clauses could never be called for a USDT probe,
> +	 * regardless of the underlying probe uprp.  Cache this
> +	 * status in dt_stmts[n]->dtsd_usdt (pointed to by usdt_stat).
> +	 */
> +	if (*usdt_stat == USDT_FLAG_UNINITIALIZED) {
> +		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
> +
> +		/*
> +		 * If the last char in the provider description is
> +		 * neither '*' nor a digit, it cannot be a USDT probe.
> +		 */
> +		if (lastchar != '*' && !isdigit(lastchar)) {
> +			*usdt_stat = USDT_FLAG_IGNORE;
> +			return 1;
> +		}
> +
> +		/*
> +		 * If the provider description is "pid[0-9]*", it
> +		 * is a pid probe, not USDT.
> +		 */
> +		if (strncmp(pdp->prv, "pid", 3) == 0) {
> +			int i, l = strlen(pdp->prv);
> +
> +			for (i = 3; i < l; i++)
> +				if (!isdigit((pdp->prv[i])))
> +					break;
> +
> +			if (i == l) {
> +				*usdt_stat = USDT_FLAG_IGNORE;
> +				return 1;
> +			}
> +		}
> +
> +		/* Otherwise, it is possibly a USDT probe. */
> +		*usdt_stat = USDT_FLAG_POSSIBLE;
> +	}
> +	if (*usdt_stat == USDT_FLAG_IGNORE)
> +		return 1;
> +
> +	/*
> +	 * If USDT_FLAG_POSSIBLE, try to use uprp.
> +	 */
> +
>  	return 0;
>  }
>  
> @@ -271,7 +322,8 @@ static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
>  
>  		stp = dtp->dt_stmts[i];
>  		assert(stp != NULL);
> -		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
> +		if (stp->dtsd_usdt != USDT_FLAG_IGNORE)
> +			dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
>  	}
>  
>  	while (prid < dtp->dt_probe_id) {
> diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> index 0f716cd40..f99fb5b6e 100644
> --- a/libdtrace/dtrace.h
> +++ b/libdtrace/dtrace.h
> @@ -151,6 +151,7 @@ typedef struct dtrace_stmtdesc {
>  	dtrace_attribute_t dtsd_stmtattr;	/* statement attributes */
>  	int dtsd_clauseflags;			/* clause flags */
>  	int dtsd_id;				/* index in dtp->dt_stmts */
> +	int dtsd_usdt;				/* flags describing USDT use, see dt_prov_uprobe.c */
>  } dtrace_stmtdesc_t;
>  
>  /* dtsd clause flags */
> -- 
> 2.43.5
> 
