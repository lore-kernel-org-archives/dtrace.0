Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62541AAC
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 22:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759788908; cv=fail; b=eSFBN+wX7EscLhsR5fd026W1yZAtGlMRy5KohejKBFwdifKY/mfqvPubGokJg8qIJUzSAtieXrO3V9YkJXjPSMUQKmYjC6ZKs2JfSwCl0n2U2CPpS6kOgEWzaek0kboRZpaReUMwye0WenwMyO7qmI1fPzyRIsyFQH6tr3KAmKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759788908; c=relaxed/simple;
	bh=55ZcxrIsCLuwHcv8ukfMBeB4RkBM/4ktyxpsiUAWVWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q1i02LssFaO8umuxYj2Lb96sRrL8XrMPhJQk5TZlVueQiCN/TzAXS50+468zg4a/27ydBtERNUzyMTKldeB5k/W+AQVBb26KxvsB81I953bJ6XePC9SXyQ2pdimq0TBH6VSwIBGUFu6ZkUwTmT7BBiFlMPx2WX989QEYj5xEMVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ixLXFUXx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TaSP0WxQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ixLXFUXx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TaSP0WxQ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596MCOCF009837
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 22:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=FL6tZ5Ihwom984kxg5
	DKlCpDv1oUrkCz9DDckprnikE=; b=ixLXFUXxt4/8uqBsERx0itpoSEQM/0EH7A
	rUz3Mw8hjwSJQoCABg+/GjGKmkXo8ii5oTM5HZx1SKxNIiq1GUwNUDlbUcSgIAVW
	25+Em0CQM9GqLXZyQLic5PA1WRWl3uWYZ+MDF2hM0HHm9YFVBFQbyQR+kZ4eJM69
	XM+X5LrZ3fp+g2mePc/cto1V7fxfHWGORj5loeXKsKVrRfxaLz5ICOLP/k4NVPZ4
	KX+dP+kRK0+3CDn8LIyez+brJufSGkAwv4GzfMaMleS7EO7596pPcHOuIMS6+FED
	Dyy/wf9uRN6np2+5yk6zMlAYOqrv55lwlqdrEY6qWoVrvBwi2OCw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mp5u80ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 22:15:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596K39JP035175
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 22:15:02 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49kdp42we0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 22:15:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7ImaxfXox/qkgqQtSz6M9Z3qcQ/i/FcdNm37paa6UdW/jlH2tlu659O/3Selb2AQFC/6pzKOzxoURHfdHgqKHs9pZCIQRIMa35baea322URjOa1nagpBPeHs3ztwtIJe66v1q9JuAR0yASX21mQGZkk1Kk4S6zn4wpkzLTJZc6cFGhydXLs/G7GqQBC9MmH5Hj9L+ybkTMPSn9Cgn2DBBNBEXqbu3GTYyib0F0WHm2H/mP9RtAgXosfO32+6USkgOl1XftZRKp+lJziccEDn6BhE77U47/Ik3KTyAC/Vd7AXCCOOTDs0Y1DIUKPjD/GlSCeDPXCoW2nGpqTkr1+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL6tZ5Ihwom984kxg5DKlCpDv1oUrkCz9DDckprnikE=;
 b=elZCXL5NmO6FOHJDgXMyV9B1Y5QuuOhD8CG6L/C/CCdJHnoXcWa2b4CcKGmsnMB0aGtWEaAcvt2t/pw2YIFAruBHqKoXc4NCGVgrEoHjbV748L2j0DD/shw6ZXQz5gOXlDTqNjAsEUljitCeyDw5mc+ArTmhskARtIaIqHS722gMlGM0XrRzxE7xwFYa0vtmQ/WP+w+FQZq3Kb1MbJXNUK2HzV6XNHPNOzeT7dCMkXaNMNTz9ba3TUKU9gxlIqEe4HOXeB71WoNQ8tSM4ce8Zumdit+aquQlfErRDEYtNe6twAwmfaRcKwy5CmAyqy5ljVatyYA0fhLNzmCrla59BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL6tZ5Ihwom984kxg5DKlCpDv1oUrkCz9DDckprnikE=;
 b=TaSP0WxQWhvNjqFDeR6vXkhJkM/nZIO6oiQkApqaN9pvr4ESiRl7hmixl8pltOrwvMzqJjhHmrEDQrWNvhsucK8gap/21JeOgRHikL/4jIOpQMiJoRceYH+1sO66F4srgEC56zQMTWxoq+eUFmx3iMJNeS8OdCoKTeD9QT6Lf3Y=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB5994.namprd10.prod.outlook.com (2603:10b6:208:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 22:14:53 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 22:14:53 +0000
Date: Mon, 6 Oct 2025 18:14:50 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/4] test: Skip D return() action if kernel not
 configured right
Message-ID: <aOQ/WnsdkXAClL87@oracle.com>
References: <20251006215726.8893-1-eugene.loh@oracle.com>
 <20251006215726.8893-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006215726.8893-4-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a178094-184c-4717-6681-08de0525c654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wOdoo0KLcdsRAFXTXrYpgxJ35k+7e93md1FrsNs0qVbGL97It0/VqgdXqUep?=
 =?us-ascii?Q?04fZn8HG803EWVYtJ9j0p7tOksYC8WhNaZXVIgxpikmZ125E5kWvPFxgB51c?=
 =?us-ascii?Q?eYwi2byxGRxsvcAbWGTm7D6QtSWe0er1kKqrVnsLx6pgwPGfLcc/3Q2bzT9L?=
 =?us-ascii?Q?j7NUzZUAtzAB229fHvQpTW0/kxv2qJJYle06QKoznPDEQaYLcLNf8rvhuoNo?=
 =?us-ascii?Q?uprDqR7hajh+xFU76QMjNJtwGxEeWmqOLbXYmfhvacjNyl0aLwdd3WAXG9H2?=
 =?us-ascii?Q?mdkVBZyk0ahtKs0s1ql9clYtvvS+/A2tUbxS0Aix0iB4HGTIzCwdcHkhgSfp?=
 =?us-ascii?Q?NF0YqqBjYgaYI8osMV0vlPgXEVYcJ+qmayHm+1Rwq5UVBBgulJhPpmJG3ji8?=
 =?us-ascii?Q?HUKJ/ulVZ92Rgh1+ZhDmAPrpVfWIPy3fc+8gW0I9tJemZOE+8khLHDYoi3LN?=
 =?us-ascii?Q?2ZbEODOq1m63EIiLMZ1ds4D10RHblpBKDgXK33z/xSuzT2HaY3vBSV8kVrHk?=
 =?us-ascii?Q?+c1EIhWLNaLZ1tKA4fL4Dh16NeFVomfAIVQUl0ERyp+CAw/FrSIV3e03UAOY?=
 =?us-ascii?Q?6tlfd8ZlJqD8duudiPJctd61hjBYB5TRTO/EbqOyb6TFFDBzd56reKB2cUkz?=
 =?us-ascii?Q?PKycc2vTRnD8Arb3HjTh4n28ZhdDWfM+58gntycD5hODUxzHDeZnlF3JuWrj?=
 =?us-ascii?Q?2rxST8GESOxqCqDv0PzVDVHosFu3yjCrmrkiWPuG0AlAvPylrSXhwTOrgivf?=
 =?us-ascii?Q?i8qyszjoQ0lc6Yvi4m05qJSGkBLxjkScDN/dDKGsogGvmgLwaot2ycDANYhS?=
 =?us-ascii?Q?mImIkAYBeMYTuevyJQmv8WGybSLAz3WMaUtMQEr9B8GgKtRkhtbDA5C/i5ZW?=
 =?us-ascii?Q?54P4nlSVRcLK51nl3cYmgtPcjmR/sKcx1doJOaNOXT7SU7og8l97Nz1dDks2?=
 =?us-ascii?Q?vXeufGVEFCmKrHi9E51rg8sXJdk5ZORSu9B34vUUgfFyUirW40PV/ntOKDxu?=
 =?us-ascii?Q?KOwfBmfnoTargJ7CXdN1uMt7Kln9FE4JkcpMYsM9goM11bUzBfo1srpsqEw1?=
 =?us-ascii?Q?TNSCThI3nEvXg+2eVwTBN/xaxhtm1vmWkhSUJeGS0bnWM+xUJ8YVxqoXM4LK?=
 =?us-ascii?Q?B4F8HQ4XE/iFk7w8bXFCfQ/ryWukRe+32KTbSViBCccoOBGWxtlMBj+bGw+p?=
 =?us-ascii?Q?dzhoEGunftd03q6iWhGV7tO5OPNe35nDXOj2xnl3ox6wLQfNnRV6VzNg1N6E?=
 =?us-ascii?Q?4wZUFb38C4s6vlj8zpnhXfddFblGGesf09nUhBsphOLxMWqoUn7eDel2XflA?=
 =?us-ascii?Q?ccGxiRL5kpMjULBp4BbDxywPClX2jaaQDyBnJIDCEjGaf9Tj2pfL2la6otAf?=
 =?us-ascii?Q?N9JerUhua26QploYUJPmyeHPbUH+sC9dXGXNmsCILPpYyVmYqw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hQ0H3Da+oMZ/pECw+uRKh6tZE0U3wDOREk7sd8A0NYvEqok1rCVkJSf2oFZ9?=
 =?us-ascii?Q?J7dGmcDm+IWJ2nfbAcRQYcVN649aAJwU8uIuUOxXS/ucNV8NUafU8/WxdTgI?=
 =?us-ascii?Q?uZap/lZTHbCU7h6pFpgUOLP/XC86/Fz50GMhl2Ys9RUxWsgX3zBYrTodpNi7?=
 =?us-ascii?Q?42SEJOOEvXmWnMyAzWXJXELWH1yUEhB5G4LuZqmYBI5oP8NYy8SKMjO9W/ko?=
 =?us-ascii?Q?Juiv81U71rbquWUKj2UPWw75FL5HXVaxFt97VzuPVpFrd9LR1p1Z2Eatx7hn?=
 =?us-ascii?Q?olrc4Vtn0bxrv0Jc+LbJM+l6akj2VNxG9yHBktXJ2Pp9Z5Q4RIbh2NZmp5It?=
 =?us-ascii?Q?ACYfzpRKGejk4SwHScKPXZyXDms5rFg2sESjJIZwpAzuXNNHQQceNIOvwdGp?=
 =?us-ascii?Q?wsodaWhbTGOX/gXI1DrQlIebUcaNGyl84aH/aJLs/HblTfR0NRS+s7xpxM3C?=
 =?us-ascii?Q?oN8jXzcuGUt3SZHFeMmWB2tx/eG3xHOstKnT+BShb7p6TvAe2YZfLOpHv4j4?=
 =?us-ascii?Q?D7kDlTl4PGubVJaP6kEMTpYQiMGKILz/wPXRMK//OhEdLE/0xZpari2mDegn?=
 =?us-ascii?Q?Vkxe4S6sFoQx0s/DFO9csQiSjMuVYfN3tB3ePIrQ0AIagiBC7dLWeYB1rsqF?=
 =?us-ascii?Q?4yURw8zUk/6iJxq4TdIPdMgywrBcjRRw+QlFNWiX9MLX2hR6gyMhDvaiXNO8?=
 =?us-ascii?Q?tVDlYvjQNqAOKCQzJwKcIA+lB+fAgRRGU2WyACK0Sft8clqMOmEBmckSDkun?=
 =?us-ascii?Q?DWOeuhk8i9ZOyLoJdw9x5Z7/OgButR0Nys/RKntB46K+VZuN2a7DEcpx1QUW?=
 =?us-ascii?Q?8XMPrBSrznl2OLu12t7S7oU1SdJ/g894aWjh4rp+mT56a6tX2D/8GGcvozM0?=
 =?us-ascii?Q?BJrYBezxAqEdw1DCErdx+5Uz9qOr3EJuB9w9ogJkd5+/4mZ6Gu+M2gAhdc3e?=
 =?us-ascii?Q?zv5tRuWVUSExhAvYjabaYHz/izllaQndLQxANTExSSZM5a9j12Jls28B4KHK?=
 =?us-ascii?Q?AMyWZRH0ap56eJdZfqaxXpQhP8N4ZDsdU2rFZNCCipexBdIZ0CCEFLo8lhYr?=
 =?us-ascii?Q?XTnvKb1KtymY51VIoSVkepnh3rWuLL9lszDw5waXMf3OkM9WIvQOhZkDMzC4?=
 =?us-ascii?Q?AJ+DobgQXNr8lFy+7dE6cvF8WBGyGuRbPP1LJhJxHlub45D0LNgKi+egWPL4?=
 =?us-ascii?Q?T0FvqjzGteKSl59NU+Re4UAO399fqVNomvL3B4AUdn8mUct82KxAzssOaBdt?=
 =?us-ascii?Q?BI/yaKH/Um2QFxCz8OfMzQKCACj/ADXtIgEiKTnzETx4VlzS5/U4HaVq6vte?=
 =?us-ascii?Q?osUdb8FkXfbcEqEQikdGqtoE9yhlNj+RGT1lUdX42JtPJqBxD63/D4wNgO34?=
 =?us-ascii?Q?cl0CeQhiSTfj+PrhSJFr4Pz/GsSSRby2+qHpk4l3Sx5sJtb2a4N54lSHrOZP?=
 =?us-ascii?Q?CKsrewCMSPBKQBs/ycM3V3ZsasEv+Fcox7IPLbupmv4sKZ393ZbMCQ2IKV9p?=
 =?us-ascii?Q?6mwIcBkIB8OeY65EqGkTeM9bcliG8BEGRR4jY9kRXs4Jlbr78ZT0WVVzrlyi?=
 =?us-ascii?Q?MtElMWbTD+YFUq36dNnXzPNazVYd7dchr4rsw/+t0+itVEsltglRL3SCni8e?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zbLXeLEihnN00/68Uunj8g8Qm32BbsMNJKbEVJRTBDhauJA/HA9fc3q8nTrSJF13xdMSe2cBBeMnLwk6CTdmlYZ8D0Nd0ZYfE73ItO1D84tuQx8rKloun6FcaZ4L3PWLHEXl8IC3JZMgm1epybhc3slupJQpHFPdapEBgs7dug7FZL9tTriMOQM1a5nqb035Sb7/iUl8u9QWt/SrTn7gKfw+bvOzQcJiZdkTbG648w10x9eHxw9ps+1MssEssFxsQBU3v++5TGFdcHl2FvikNjR4dYHQT/7OT78wBM/xgKU8WUZvueKoIhzRG4OwxQ1CeOEoD3FyhNmz548+DdRFbxIpG37wcvlClId466uQcRvDLMTyrnt3phVyXeXeJiSeo/u+g2zIOsRy5uRRYqUP6PWlyL3vEAiYVSudYDLaQO2EGHmaq5zfTy3HomGtBKSTbezETgcTAb02myD4JsnrLtrFnUt2iWyi7zKGwwUP/the8cYZIPrTgrjJs++3lo3VxbMyZYC/va8x6WVUmecYqZ9zSHS1Ra+f92/+BLNv9Qf3CkkhiC7iZH+boURhduMQ/f39O6RaefV4hJ6WxYDSofz4kckBTpiQtON6kl0NkPs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a178094-184c-4717-6681-08de0525c654
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 22:14:53.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4lLEKQs6KqvnDCV2PEkVChUssrf68yTGCacQYsfe8jvtzoGip1lq8S7jKfzsvS+U/YEJrl5trqv+1nfnk8oND+9WZf80JqGFR0Hh1nrpYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060175
X-Proofpoint-GUID: tryL8JrSjN7AkZxY8WSBD7IuWuFBkoOG
X-Proofpoint-ORIG-GUID: tryL8JrSjN7AkZxY8WSBD7IuWuFBkoOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE3MyBTYWx0ZWRfXz5gtYF2SmBVr
 2lUovlFYwYQqW+iNTbvWRjPaVDQNl3XmYzmDsyWU6nbCpypU4RmlsDvyApakwUfBZqynRBTlrJf
 msJ1CCJxI+WN/emI6J97s6kx/GxaGQC7pPelHC574psoUuo+16nnszX9IWhdVzDzIjL+hMNIryS
 yX9vf6b++zM5ZzQ7VCefA1zsC6OSemVbyhuJjNoES0+1kpVQTb1gC+1XWu8tk7SWGiv1fGiO2D8
 poL67hjUZeZrZ0AyyqtguoFWYiEfeSBmDO7rEW12AI33gW1tTDLLHVXeu5EshbhvgxRO5g4IRQ0
 nQ46/cTGIQFnDNqhFwfTuuOd+frMu0MCVb9c5cYq9qKa0oWtmabx8CxOszvlopbDUCE6a6hXn/4
 ObzBz8110nQNLTJJSmQSBknIIstWe4nsxMgWsNFr2gBSYOqDZZ0=
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=68e43f67 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=a5pi9filAAAA:8
 a=xoWpuNgw-iaLeInldtcA:9 a=CjuIK1q_8ugA:10 a=Mgsi1gaY6nDYMq3LkgpS:22 cc=ntf
 awl=host:12092

Why not just check /sys/kernel/debug/error_injection/list?

On Mon, Oct 06, 2025 at 05:57:26PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Most of the err.* tests can still be run, since they test other
> failure modes.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  .../unittest/actions/return/err.destructive.x |  1 +
>  .../unittest/actions/return/tst.destructive.x | 67 +++++++++++++++++++
>  .../return/tst.override-getpid-entry.x        |  1 +
>  .../return/tst.override-getpid-return.x       |  1 +
>  4 files changed, 70 insertions(+)
>  create mode 120000 test/unittest/actions/return/err.destructive.x
>  create mode 100755 test/unittest/actions/return/tst.destructive.x
>  create mode 120000 test/unittest/actions/return/tst.override-getpid-entry.x
>  create mode 120000 test/unittest/actions/return/tst.override-getpid-return.x
> 
> diff --git a/test/unittest/actions/return/err.destructive.x b/test/unittest/actions/return/err.destructive.x
> new file mode 120000
> index 000000000..2cb5b1159
> --- /dev/null
> +++ b/test/unittest/actions/return/err.destructive.x
> @@ -0,0 +1 @@
> +tst.destructive.s
> \ No newline at end of file
> diff --git a/test/unittest/actions/return/tst.destructive.x b/test/unittest/actions/return/tst.destructive.x
> new file mode 100755
> index 000000000..d54bbb2fa
> --- /dev/null
> +++ b/test/unittest/actions/return/tst.destructive.x
> @@ -0,0 +1,67 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# For us to use the return() action, the kernel needs to be configured
> +# properly.  In /usr/include/linux/bpf.h, we see that bpf_override_return()
> +# needs both CONFIG_BPF_KPROBE_OVERRIDE and CONFIG_FUNCTION_ERROR_INJECTION.
> +
> +# To check kernel configuration parameters, check
> +# https://docs.rockylinux.org/10/gemstones/core/view_kernel_conf/
> +
> +# Look for a file with kernel configuration parameters.
> +
> +file=""
> +for x in \
> +    /boot/config-$(uname -r) \
> +    /lib/modules/$(uname -r)/config \
> +    /lib/modules/$(uname -r)/build/.config \
> +    /usr/src/kernels/$(uname -r)/.config \
> +; do
> +	if [ -e $x ]; then
> +		file=$x
> +	fi
> +done
> +
> +# If such a file is found, look for the necessary parameters.
> +
> +if [ $file != "" ]; then
> +	if ! grep -q CONFIG_BPF_KPROBE_OVERRIDE=y      $file; then
> +		echo need CONFIG_BPF_KPROBE_OVERRIDE=y for D return action, not found in $file
> +		exit 2
> +	fi
> +	if ! grep -q CONFIG_FUNCTION_ERROR_INJECTION=y $file; then
> +		echo need CONFIG_FUNCTION_ERROR_INJECTION=y for D return action, not found in $file
> +		exit 2
> +	fi
> +
> +	exit 0
> +fi
> +
> +# Some distributions, like Gentoo and Arch, use the configs kernel module to provide
> +# /proc/config.gz by default instead.
> +
> +if [ -e /proc/config.gz ]; then
> +	echo try gentoo
> +   #    zcat /proc/config.gz | grep -i <keyword>
> +   #    zgrep <keyword> /proc/config.gz
> +	if ! zgrep -q CONFIG_BPF_KPROBE_OVERRIDE=y           /proc/config.gz; then
> +		echo need CONFIG_BPF_KPROBE_OVERRIDE=y for D return action
> +		exit 2
> +	fi
> +	if ! zgrep -q grep CONFIG_FUNCTION_ERROR_INJECTION=y /proc/config.gz; then
> +		echo need CONFIG_FUNCTION_ERROR_INJECTION=y for D return action
> +		exit 2
> +	fi
> +
> +	exit 0
> +fi
> +
> +
> +# We cannot figure out the kernel configuration parameters.
> +# Go ahead, run the test, and hope for the best.
> +
> +exit 0
> diff --git a/test/unittest/actions/return/tst.override-getpid-entry.x b/test/unittest/actions/return/tst.override-getpid-entry.x
> new file mode 120000
> index 000000000..36e160027
> --- /dev/null
> +++ b/test/unittest/actions/return/tst.override-getpid-entry.x
> @@ -0,0 +1 @@
> +tst.destructive.x
> \ No newline at end of file
> diff --git a/test/unittest/actions/return/tst.override-getpid-return.x b/test/unittest/actions/return/tst.override-getpid-return.x
> new file mode 120000
> index 000000000..36e160027
> --- /dev/null
> +++ b/test/unittest/actions/return/tst.override-getpid-return.x
> @@ -0,0 +1 @@
> +tst.destructive.x
> \ No newline at end of file
> -- 
> 2.47.3
> 
