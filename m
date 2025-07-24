Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8EF148830
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753382052; cv=fail; b=mOA44hVc1bLA/FE4pxcw7uhR9S+ju+aL7Z3aGA01U99L596E+42YNbXpdZTdIS3pZvFS2uaxgb1HT120AQ1An1geTPEKUVjct7CqWp8mohQF8CTnWhmDEJZCI0kBXoK2NjT82Uw/kMz9Vp6Ku3Ah4cS4Vb9reY2/GsLdeThESoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753382052; c=relaxed/simple;
	bh=BtqRxPd85SZQvMTAtUhpL2weEMqwTNwSqaX84njH6JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hpKZQ4mprZiBAolQvnk0ooxLLPypK+Q4sMiwUPw6HHsvfJ2/T9FEcElBiy0iOORkhKckaQeav7PL2QaINOtNcx4fzOfrVJAxHSPPQB3HDlPe56KcDZYQUWjCOAccaSroJxUK99epB+2ZHqlzXtRqcj4vVNGhPlFclt/dMKRdqqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zv8r7vZ3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z6OdPSHp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zv8r7vZ3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z6OdPSHp"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OGiuGg021494
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1IEZyjmVxOmTJIX8zM
	y3MkwYtJIs5bY4EBC/W+hybsc=; b=Zv8r7vZ3+Aa1MWV9/VLOqkCl8CVGQ1hDjx
	ykP1y7zvpGQuiMxPnrSStq0chpEZp3/1xe3b2PpSRjt+pOB7BH2swe8rMxZeAVpT
	RNfMUaG9BynHA8LWo9TdU4SPbQNAUE4morV7n9cQzFjikw5JFiqcwzW+UH4ksYT2
	8sOiGBX/wz75Z+xSYhZGg2cEo03vdKF1m3W6rMS79yZUACjDt9EPHP/J9t7s5weo
	3wVHQS6OIdVqdmdxYXMcFd2rwNQQdxdd5ouM8ouvXcjUcwnujL9VJWLk4P2mRbfW
	YgyKGaFbCqpeJY6fXZUxTdMeGopknMmQwaipKZr4jzoml41vDPnQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 482cwhvpc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:34:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OIQlLB011527
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:34:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tc5kr9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:34:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VE05m4/dg2OQ46P8PNr9zUpOulAkH33f46fy4dcGIYc/nzymUuw2K/qoGBlUGsWeKATPkdaxh4Zg5OXFQuNhoPYmOtMmp7iZLaf93jaFblqlSElSP7cCo7mAz2CSJUO2g9aLMzh0KuLzOs6q6F7cH9V5xwu12wcfV+Ifk+Zzz59Lq4mT0gIYQIB7b+xYirJ8X6wif8HMXu/USKyVm2ZVBtpUdlSc9EYpTZiubidNwW0JQxj0u421TO4VxfXqUhsWMGxMnaxD73Tx/iVyqaz9GdknYnIOAXEPTfr2H9HsFxO9y+XgaWiSsXwepmgyv//HrRD09nVKaVlyxdygv16yuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IEZyjmVxOmTJIX8zMy3MkwYtJIs5bY4EBC/W+hybsc=;
 b=tBQhVdEJPHbEl28mUFDgyejN8fuNhpSm5WkWMD7LFv6++g438y2pbfjPewcAFWpsF3py/h9wwxMbt0WIQ0B/1J91ry6PPLAYKl/reBOrDGwkRHP8kXk8sRJQsO4yrALjETnXW4iAgs3+mmfk420hb9c9G0vdKwUojp/XqZqy5fNL6zlfGS73o1vc3upKGcWggAwkmeA2RYZRdrbW6RxwzYWpEjut6eBBcJITvMd3oHTk6SNhZ00iPb4+GA7xXftCkbNZTNmX08h/HHWzTLqXIuKeXstSqAPc2+MqYwGUnb+JC39etScsomuBpSF98JA9hRCWGeui9MouYDinb/e1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IEZyjmVxOmTJIX8zMy3MkwYtJIs5bY4EBC/W+hybsc=;
 b=z6OdPSHptUQqsDpBzS7vuLQ3L+0nNKbvTZKm0Rt8fgpH94ZvINEJ3+jPGYGF+qY8PJJT6j7UZyFTrwQfG00+sBb3UnIxrFs4LaLYaR8Cw9YhkYIfbiCPHqoe1Qm7zmUCM8gAqpB4LXZHtav65PO95KUkEJmo+ZYQZj2qTwgL5Gk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA2PR10MB4729.namprd10.prod.outlook.com (2603:10b6:806:11c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 18:34:04 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Thu, 24 Jul 2025
 18:34:04 +0000
Date: Thu, 24 Jul 2025 14:34:00 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        DTrace development list <dtrace-devel@oss.oracle.com>,
        DTrace dev list <dtrace@lists.linux.dev>
Subject: Re: Test that PASSes but should not
Message-ID: <aIJ8mKI0nSZviJnc@oracle.com>
References: <aIJsb0P4H6S+tO0k@oracle.com>
 <a7197497-1d4a-f68b-f62e-5819e94515f3@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7197497-1d4a-f68b-f62e-5819e94515f3@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA2PR10MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 132105c6-9c84-49f7-4024-08ddcae0aabf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PRCKfBIzo1yD3TEyfg3a9LM6+hLtmhYVWC+i+GKbRAs/pkbuYjieCX17NfPa?=
 =?us-ascii?Q?0+3T68d5XWzIwhuvZQOYmAZNMwKzsDTB3ksz5OembFP1u+g8zQhQBsDGl2dj?=
 =?us-ascii?Q?MpabzQekAIWIzhzUtOamj7W7ywur367kgKcjWHVzp6laJ0aUCfv0BRrIywkP?=
 =?us-ascii?Q?PQNmJS5RWarkOS3bMFQnXpC4ARmQKZjkDY9TQ0MtTnGg2xdO3gC8zLKQe1MT?=
 =?us-ascii?Q?zqIrAjU3wrCZhwzJ66HJv/8wZLLhGZ05OAV8c/BwTQqKF0ENFZaX6ztuhGUV?=
 =?us-ascii?Q?Up/li/3sAT6bQXvMC8mzCltpoNTZD0jOnEsUnqObGf9zxABlkDJnEI6QJ3Vw?=
 =?us-ascii?Q?gKX53NWhiLmAii2SeiurcEOeGalKAw7H5PlwBpIXhRXiDY8sAAit+BMNN35f?=
 =?us-ascii?Q?IN4fT/X6/B+yOUJEam0L0tAjfIqxgfS5TOITOIw5ng8HsT+FUvdv+pX1VlX3?=
 =?us-ascii?Q?aK+Ei7cw9hI5IiwozSXVP1eYzl0DnOq7vYWxolmItDsRrbqQCHgDC6wwOrfx?=
 =?us-ascii?Q?TfpCJIyGWeGerVM+SLckblRwdx7cVFxjfpnaoVNSwxHufWTQR0cG2BW0/NB5?=
 =?us-ascii?Q?D9jvdbuhvEF85m/NpntLzHNHApqd0K8cuH/MUl5DUD34iiYdig2PQZp2UnSa?=
 =?us-ascii?Q?fKfu3bRVvSt9r6Cpy3bCno3NyU9ftVRo+AKF71LgHMEfG2RPZt3Sxranfz2Y?=
 =?us-ascii?Q?iHt3IPWo8gZcKVFW0dK2FaeOwgNDThQAKED940GXXelSW7I3jFPC1SSmf7n4?=
 =?us-ascii?Q?0BACihf3+iOk6y3Mg5NUGyNXLDhyDQaJIGp3f12vSltheGlhx20/cSVPQdl5?=
 =?us-ascii?Q?GY6/oFq34fe9cIM4zvuG9B7IQWsyC5yZCiUgf2Xy7vQpB8G9eCLbSCAM9Ma8?=
 =?us-ascii?Q?HIAkrgUyb0MEBc4p9Cildw1Bauj/RhEUn5LI2VekjC2A0kUiBGuODy4pxJGl?=
 =?us-ascii?Q?13Pkj09osIo24J8snruyr/lm1Bqc6PLQTbAI9h7u+aeVx9MxTWKsgKDxDHI0?=
 =?us-ascii?Q?xSc7Lm5mvr5AFdZxz/HoH4fcJLCWTspiBdcmlLuJceFJKOgcBNY5/bes5bD0?=
 =?us-ascii?Q?DrwDujVK37mBWnz0bDXR7vNuBrmEjd4BbqXSEAmu1r0CM04d+tBvQXgVorih?=
 =?us-ascii?Q?y8hbqU/Wr9OjMenrhm866JcSQOzkycJZgowi2+RMVTcL8nls4R8AbNN6TBTd?=
 =?us-ascii?Q?L5iSwzWu2uoQrLUIKUwE+CERaN5OMHvMdz8wFZq83p+Zt8rv/fqLYZmoi3cs?=
 =?us-ascii?Q?xI9JekgFTq2fZA2L9KMRWESNWCEqbWAroNwWY5lZXfn0kNMC9PL4RaWUArfC?=
 =?us-ascii?Q?nd8ZmJb+C9R/j+5exwdf9i+mdy2bJE5KWRtgHDjFKJJKL/gCY+N//GZSWyYS?=
 =?us-ascii?Q?7xzaJGuqoOLB8HCjPfCKYZ8oWLpZZuetkN2diW2rJy/FheqMhSBgTqLYGS0p?=
 =?us-ascii?Q?G8c14J/x8lA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E6TINd7iLs+YYdm7yhJHKiTJuUajPeKjzGPFn65CYcMdpHt/s28ezgOh1CyB?=
 =?us-ascii?Q?OiWYlHMt5JGgsl4mypHy3UA9q90PbbOduRG5NTCjBIoQAmQV2RL1JHB28/Fo?=
 =?us-ascii?Q?x6Gv/UieVAZEf1jWyVE3EBbswPMpZaHVfSdo/H7IrY3NKL6H8KG9+kTpNFnU?=
 =?us-ascii?Q?nloI7hgfMyUh4nUFcuXMJkA7t3cYnqKOYuh1yHnlt4RYRAJEIL4Q2OX/A2rG?=
 =?us-ascii?Q?o8tz/fs4qrCP2SE5wr1LmR8rr5kqzK53KUPmTSEIQDwNJIvU1hKkUaMky4Aa?=
 =?us-ascii?Q?cZicxrTrvL00F8ZLzkqbbNCMPFXWGuv3CVb17yXQIckjYSI7sukYlTsOKipU?=
 =?us-ascii?Q?rALslX1VHv2mc6Wt/yS/GKZfmq24pQM5hq+QqO+mm6kK6hfHdYsJYZ60F8AF?=
 =?us-ascii?Q?BXNSBdPm/FXx/zMU4lM9gEKZZTLlZbGMKHVGjQL52AtmBWDhCc2soeDrrRu8?=
 =?us-ascii?Q?52xgREQqzVZQiRkb3zz/h8ui7IgegUR8DZ5rwU88XRDosc3NH7V0qNK/6esw?=
 =?us-ascii?Q?W9iQWoxJafpcl/U0KuV0WDBilnFtA0W+nOhXSrqoj3ecjVobDOEhTpHWQB/w?=
 =?us-ascii?Q?jwiKRmhV0gbbE8707ZAKnfl4Az2g99MEcnXKDtCw9E+q/33bk+stJtQmoWa9?=
 =?us-ascii?Q?ntvcb3K3nPPTbMTqohg4/o56in303EiS7nBnfi/6mIRqHreX3pfij074kvyA?=
 =?us-ascii?Q?IgFIwVh7ASqy7/eVL/c19F+ktU82KarCHXut6Z5Cl5OoxLpo9L/73YJQ0om3?=
 =?us-ascii?Q?fX1iDsgzs6ffwupgHhkg+V7ukADuUz6FCZ67F08LlWF9sUsQXCo2OJhI7Y92?=
 =?us-ascii?Q?Qnnc/H3xYtmDAdsz++fE9XWvuxYnScyQohUkxowyLG2QCANRCALr90GDHuZD?=
 =?us-ascii?Q?9ubJiN5HIKh4DvrCuWNHoqWmFffb1Fu+m7vaSzQFICLqz7IyPBn+A77QqrNH?=
 =?us-ascii?Q?tKN1o9tppyH+3EoTrpuLaitlzQM0pBGes3nZ+qzEbvqqzgPqTU2CpCkuupC4?=
 =?us-ascii?Q?M25PQtms1A2o1Bb00hexT8SMnWPUO+nsaXYf4xF7BfzYEtAsd+ackGeSl6ra?=
 =?us-ascii?Q?+0Zz+8OYoPSUMOoMfJNp06s+z0LoYeuMIruQ5CoKc5xy7bsnwXYqAvcQyIjn?=
 =?us-ascii?Q?l8YAm7gt1GJBkcFMUCoNTbod4cxAKh4E1ycD5TgHTLSaKFTTFAKMaafmO7fW?=
 =?us-ascii?Q?P8wki+NBern8E3BonslDvL6H/auaqMkg5JE7nKHwBuoswOetHwLdULhF4+4H?=
 =?us-ascii?Q?rHQBwFbJXnjnXV+IKHbuzaRlIKULE/AYRgiYXOs3S0xjZ01Bp2zOK1IQT80n?=
 =?us-ascii?Q?4wf+B+u36vnSfhaA1Sl0kY7HZ1eVEhaSqhSx8MdsZruJ9XtKbKe902mNES5S?=
 =?us-ascii?Q?+v8T9WmvJEmyiEYWXFW2B4AVTku3+vdnJeEzTzIbznM2cGs2z2MDFDR8Jd6S?=
 =?us-ascii?Q?1cMxAOIwWMBvWSqGiK290TUWbsLdFAWNhzRSLslDtDPU/E43g33ydS7v2yE/?=
 =?us-ascii?Q?klqvwJmh2rTmavjVGQ86GIHGhdurgQnJea7tO8QxpLPEJNmvqHh7iulpCCRU?=
 =?us-ascii?Q?9MO140z/zZEiYVqZLsu0ppeUPnVrTTDph23htE9hZp55aQhEpUz7deMF/PjL?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FzVYhzZb98a37Q9hC6EVp5Va7bSOUZhiW8TZiLENA0UCnS0QEe6eNkYMQ3+mr/ZoBUtuQnPs/qQkrw4Fms2b0I7WfIqy7fbq10OZzRB2n8lr3mIkhMGyHY1lD8P7p1aG/s87mwK3X5XEcxn5ipgj4J74H1U+qPCbBAs8roiAQhzQwfpw7LLHTYmghkv2seAXPFAw63qh67IgUA1Usvi7/RCCdKO/cY0MI9Xp3ir2Tot4YuOR+6h1nUZvPDWJEvLX506CPGc1CsH+TYPKdULPvqjHWV8eubqIO1LFqKDMR5Qj3hj1nhdKthL0XMnqNvNKDjguMrl28VEjBYi3dH2BGVvlyPP9k04w5JskVjYayCUyKogwmNDBB2v8vskATPA+i0FzL/vWvQYPpKjOUR5RyMdNLcnziTV+lsJJP1aT8fBjmLjo27e2pM3wS9MKNlM4btc2p297z+zD7a60Y6jPZDmvEbXuvfbDato9r/qlgYR1CuBoTQRbe77HZpVaIiYiqrqodAAN9PxYOPvMfIchhz9asvpGmbT0Jbo3270I5lThDbgGbqmf9lnK3V7hdGjjwn7FVNkxAMjU9AOqF/KElkaJq1XtNL9j/JQ8YrQL3vg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132105c6-9c84-49f7-4024-08ddcae0aabf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 18:34:04.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYrLUPXMMGqi3uLKZtHfrT9t7T0aqiAJ56H2GQtvuEMgDEQvkl6eJb0LzBgY0yA2OdbkrHuFqDrhnYM1c6bH975EJqQRvlb9bWvjRBWMs3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4729
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507240142
X-Proofpoint-GUID: JOQs0Ju_7tfqphFXCOf9GGlycssgQtTm
X-Proofpoint-ORIG-GUID: JOQs0Ju_7tfqphFXCOf9GGlycssgQtTm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE0MyBTYWx0ZWRfXw3TS8TIm2hag
 3btnZJI51zZg2SkOeZFqkzIG9tngCWilrSclJaZ+bwMnm6yi3xcyd5DKBanGv5KuvpK0KWGDQji
 eisOPwi27KWgize8Xk0srnIRM1UIKRLiqfItOMphvkCiRPn45nk+ZYQUnenMykucNBBSuq5ycAt
 RQsWBunzlg6isCHltwOlBV4Wx3YZsA0buGQRb5waod88v60BhWNNrCeI0pf25dLEAdI2U9XUh9r
 bP/LNNR9xSIr7jvL3xc8fS1R2nplwbgbCAXTh6viAIC65mQkXOZw94z5xFBgpJ8sKr+IHyAIV3s
 3rQj+x23FMsjKmPLs1uJuJ6fRoHHG4w+AiLdgHV6uMmAh6EQSyUwIIXgv0r5yZRE2T/bFvMrgTp
 1a9QeYE8LfjrSNDML5CmtjbOqDlTMZtA8JexTcoF4YMTAvJsfGWPRJHajm7b8NNC0Vgjvskk
X-Authority-Analysis: v=2.4 cv=IPoCChvG c=1 sm=1 tr=0 ts=68827ca0 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=2ih0gh7YiuoYbfgIeUEA:9 a=CjuIK1q_8ugA:10

On Thu, Jul 24, 2025 at 02:21:36PM -0400, Eugene Loh wrote:
> And yet it has a .r file?

Yes, the problem is less with the test and more with something going wrong with
BTF handling causing the probe to not have a BTF ID and yet it is trying to
load a program for it.  Attachment should not even be tried in that case.

Working out what is wrong and fixing.

> On 7/24/25 13:25, Kris Van Hees wrote:
> > This is not a good thing:
> > 
> > test/unittest/ip/tst.ipv4localicmp.sh: Running timeout --signal=TERM 41 test/unittest/ip/tst.ipv4localicmp.sh /home/kvanhees/dtrace-bpf-user/build/dtrace
> > PASS.
> > -- @@stderr --
> > BPF: func#0 @0
> > BPF: func#1 @154
> > BPF: func#2 @1121
> > BPF: func#3 @1136
> > BPF: func#4 @1350
> > BPF: func#5 @1355
> > BPF: func#6 @1438
> > BPF: func#7 @1453
> > BPF: func#8 @1667
> > BPF: func#9 @1706
> > BPF: func#10 @1746
> > BPF: func#11 @1926
> > BPF: func#12 @1995
> > BPF: func#13 @2064
> > BPF: func#14 @2074
> > BPF: Tracing programs must provide btf_id
> > BPF: verification time 33 usec
> > BPF: stack depth 0+0+0+0+0+0+0+0+0+0+0+0+0+0+0
> > BPF: processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
> > dtrace: could not enable tracing: BPF program load for 'fbt:ipv6:ip6_finish_output:entry' failed: Invalid argument
> > 
> > That failure definitely should cause the test to fail.
> > 
