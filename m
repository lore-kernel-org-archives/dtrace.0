Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6161E17C7B6
	for <dtrace@lists.linux.dev>; Mon, 30 Sep 2024 21:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727731179; cv=fail; b=DxIqn4Up12YXbp/nv4tGOzByRH4jCRr0GfLey2FBP2fPkI/J1RkMoLN58YBv8HdUe8o+MGUBw2fY1qrz2uQB4uVu8asGZM+2xZ0lOzjJZd4VCQ5U98ydL0IHCUotW7Efvg+eNJJGuv/2rtOD5zSbH6P68/PbQXvVObm870DKVns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727731179; c=relaxed/simple;
	bh=JyzQnMRMgA4drcauKSea8QZlo1/FO0xqZa9Jc5PFDZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y6WY3/zVdKwZJfda3J44a3KrmDOkmIo7YGYD2ynt0K11LikDa16CVKxGrWBp2A21Ze+TAfCQnrJZB8Kgum4NZLwE0OpZfzr5AW5inbbhYacxnbDkga+RrlqLwasdh4yAQW1w4QWb7fxFDHthzG9DPkOruYG/pQ/+Lpqlfw6TAOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xhatnq4Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xM04cTiv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xhatnq4Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xM04cTiv"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UJu9Mr024103
	for <dtrace@lists.linux.dev>; Mon, 30 Sep 2024 21:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=3xV96sShzZIkrUK
	wtTeWglr9I+vfRAIXSLhgxbkAeVQ=; b=Xhatnq4QpFzaZq0+rZeGSRdDHoy4th8
	Jc4LT3WATfGonDwS4OpDK0MRbM0MGVgfUZqoqg8v0d0tC+NzUu3ScILh5QONxZ9F
	Sj7UCrkau51vWZ54q/fkg3rnmzjmaAtgO/xL3P5R5qS9/bFO2fy3LA+hGj3kpuS1
	8w4KE19/vaHYg1pRH+CIbIx5JVUftbFr/YPKft9T9Ce7+1RmJ6OtBBpECD6iKOWY
	4RjqtEn2DQ+lszbhtO2NbYc3HCcFXAKifvhdjV+NpKh/SdWWhOkauzc747ilHmIJ
	8js5Ztp+Jk6E7WN/k/8cas7Rg22KGV4k+4PfdpXsebK07f9LJiS/IOQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x8k34v20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Sep 2024 21:19:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48UKIADI012522
	for <dtrace@lists.linux.dev>; Mon, 30 Sep 2024 21:19:35 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41x886c5uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Sep 2024 21:19:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CR0nkJ7WqgeLAvgL+exqI2ckRCll4oYAdhiUxFhhnAp5d3m7EEyFA3hrvUCYLE2k6JYKs5clUdUl6AVfMOnGZCYSmQBhNhcRw2vYsp6UZhpRcVNIayx0MZsEAgiM2YvzV+HUJgDdxXUTHeP7GSZyy5QZrFnzZMjZVfpjWJdGzx8+Bdt6G7DgFejhMrwTD5V6u0O8QryPxD10fZU8wjOW4kWFdHEWZwJpakDlicZHpzM4XlViJjINfKKcbAEXV1FLgT2Wf3p1fknhcKpKKE/sCa6TbZhkhIZqmDy5aBSdvpaKerjZT74n9NsGdcogKh7UNMHjznq3lgeXxGyjdRwtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xV96sShzZIkrUKwtTeWglr9I+vfRAIXSLhgxbkAeVQ=;
 b=t/6NFrckEe79xvSip2VC0exwhnb8iK70DnuLUm24/Ggj6eIzrGWnKlwbj7stvalLBIrn3avIDc1thjtf0NAyq1pGk187DpZv5E0cmIWfb+fi5iY/EqAYfQRHQiTPxU+ep7AfYIWUBFrhYT54zIOBpM4WlkHH+mfKtff+MmwxRxhG9UeoEKOoqmSmI80uF7o/3/icFH6EgB1loyW5J4+co6T5TVWBsQ5uHHmPvBA2ztDSchuoaAeNTQtyCE+/pCTCJaQ22jOhu5dPocyeamJMCdDmDKfQHx/ULorrj4Oxfi6JRWVgFGKLBy5lk5LvsbwcDNf+UO1e7K4j4rEV2k+jDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xV96sShzZIkrUKwtTeWglr9I+vfRAIXSLhgxbkAeVQ=;
 b=xM04cTiveo3QqK0bqGNVLPMfFk+y4dgpa/OYQ1uEO2taaRO9zgpY3DKAnECH9dsMwpXJwlrSsZCdC7lVJtcoDHzA1mpxlTkPNug04t6yaycgthIMtrGKRLVsI5ts4E6qzcvD27RZVwkNaaZ1KlqZIfgQVMRY9kbMiRVIArAcwk4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB7010.namprd10.prod.outlook.com (2603:10b6:510:274::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.14; Mon, 30 Sep
 2024 21:19:29 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.8026.013; Mon, 30 Sep 2024
 21:19:29 +0000
Date: Mon, 30 Sep 2024 17:19:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 30/38] Allow relocation on BPF_OR instructions
Message-ID: <ZvsV3uVcPUBTr19i@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-11-eugene.loh@oracle.com>
 <Zprb2ZiDYTWEx+Iq@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zprb2ZiDYTWEx+Iq@oracle.com>
X-ClientProxiedBy: BL0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:208:91::40) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: f41a3bdb-4dfd-4b4f-d83e-08dce19591f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KRg2orY/e/MMmY/i9yXD9Ea7sZKMMD2jXgVye03W4Td7cqUXSfZPXX/eGGpI?=
 =?us-ascii?Q?+XehlYi3p/1Oc+bVqAa/JDUQTAT4nqi5oKVghE1qHLyy35ZgXYtxX5yUGYSy?=
 =?us-ascii?Q?MbkEPnggi3mYNh8NM635u1KzAuumX9fYUckTiX0H2HqTKipe2IDb2NUpy256?=
 =?us-ascii?Q?p6FPxP3S40+GCdD55mmJD9o5yxk9yIW6eiuAZfxWMr6p7W7papM6cng2+Uwh?=
 =?us-ascii?Q?cM/fdqOr5QeBuL+sQHUglDAc1eOV8/x6OJcWvbsySrN7SUeat3RNCcZp+0KH?=
 =?us-ascii?Q?P+Tz0/l1NualrSE9xHp+s0ZM9FpKTQ5PkmKvWcLcUzDOoHf+F/C25OAy+9Dp?=
 =?us-ascii?Q?c983L2jBCKYHboRtc8asgBR7GW9o2wazxe3mbOyVkA3JJz2e3FeI/oJO0WMG?=
 =?us-ascii?Q?kJF5tCoLA7AlXJoLy1hj/lBTZAqV/1BM/RVCsrQeMbDHHhLHnZcemKDSzp3u?=
 =?us-ascii?Q?xxh5YqWkt+wNABFI7RS+2SzmqivdriEmWeqVzsxCdAV3EV/fS0NgfYSKgi5J?=
 =?us-ascii?Q?IBgi1r1GCeJ88B1IiBEKA9anxXqLHbh9TJ+4ekpT+mdqAb1rU423PcsEA5pG?=
 =?us-ascii?Q?7aF7EXSm0WexdL/QieZ6yNSz2Y6N2DD2F1q3SuHofaVOFlT+yyxPUpeeWIUT?=
 =?us-ascii?Q?VrNwUjZuSrRkBENnjy53aBg7ort67ygtoFe/BoRebM3gXYfthDF2NOTzVPvG?=
 =?us-ascii?Q?FN70yt5R9VoCKDxBPs5/T6cScboXUryo3Jwb7U5ytlR9eQGPa5qysXLs/82i?=
 =?us-ascii?Q?fivoEB6eJx8tBC9N3YX0i+MbFkwyv8xEg+ycpCi6a+oS9vQxyceNxlaaTpeU?=
 =?us-ascii?Q?cQ3ou6PZGygOURjF2Oa28zIKQtn5C7pHIXWxqTxJwtH4TRE5TSga4MEUKEwF?=
 =?us-ascii?Q?hIZh7U34XQYF+Io8eXZWtQ8nrcUABUBNUTAU1hg/OElc5W3nZENhTB972gAB?=
 =?us-ascii?Q?T3C/N+Xr0CvT+1g+zWx+xLVmC5NbjiNFgFovh7kox1Bv1XwFji67xF86L7Dd?=
 =?us-ascii?Q?wfdieoM1BWQBCVyTaxOHI4C5E4NxLL7YJUYyLoyFt9N7DvTExrue3ZAuKuxb?=
 =?us-ascii?Q?cTUm9eSSUzfqPsHK4XhuZqoQZh2/RPySpWqIWKtS+G2Pbf3BfzhYVWo9Hojt?=
 =?us-ascii?Q?RCMSZqIwZIulsaznwQezY4RsL5inAlKTz4GGqzrGajPp+tKO0GTDac6Qr/rm?=
 =?us-ascii?Q?jwQLVMMEkUwK6wyPEVdgdLnB1v/A9DlTcK9Ap+Hb7KhKTQguWUxoq9R9X87E?=
 =?us-ascii?Q?5R0cRHFq8AFX7lzLIrtvhqoDoQnKNYWUnhuRXciRh8e0TiDrCumtv4nbpPH3?=
 =?us-ascii?Q?fyQvKR06WpsEmnAE8VTvyypR0uj9i8GHeItMFW7RmW2iZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lZyDnMfZ9o3vbrYtgltHveQblzcZuN8c7x4zD9ezEnvkh5XlEfjOudJCLNwS?=
 =?us-ascii?Q?EEoaJHVZbT2rZ9U3SwfazmgRuo7hXsfFZfSlwSLMU0DZNvRxh434/WsHMNWy?=
 =?us-ascii?Q?zU5LDeCm2FPWTOpPdLbutfDZckpezM0csoQf95EKYGqVPD8Kz5lN3zbTBYNc?=
 =?us-ascii?Q?XIKuzjmV2D0IA9At5CSdJ89mLQBfDiYxE2hEq8+TmmmyYVZUmQ1aMpSwypbP?=
 =?us-ascii?Q?2yLF7WNAiljW8kg7ZeMw8bfv0eQs/ZrR/gKffizc1ltE7cV+DA+mDJ7cEkGx?=
 =?us-ascii?Q?bhhg9PWihHzT8TAzXGM64QOS2LdO9rc95QkWeOpqLpyHSLiAhxtnCznn8W+Y?=
 =?us-ascii?Q?cb84zBZI5kqKi687CA2Ug/36Cun4yK53NYkQ/a6e10TZq9RjNvZ4b0YQGvFZ?=
 =?us-ascii?Q?vXqcq3DskJ0MoBjOwk/4+edTcX7I4rxvk/Gj37k447vkYdgwHyQ6rMGt7q3C?=
 =?us-ascii?Q?e5zIqknoEe2PT1LzPIdB7Fae/l/ty5PcoAevWw3RkVYkkKojDQ/jeRxYJRIO?=
 =?us-ascii?Q?jm2Rnv6wk+tsECaJqW3Beed3oCKqoC2V7dss3i8x/mkeUuQs58tth1+YvuzA?=
 =?us-ascii?Q?/U01zxcfgQQpuNb1a8udv15C+SVyc9/KJV9VEiwB1JHFREqoohzJpCC1K0vr?=
 =?us-ascii?Q?Qtpzi18wpYHGIy/J8NELNAz/WbAYnngRafpxzZjR3UgGJHF8vawU2F+idiVa?=
 =?us-ascii?Q?KMUv8RIVd+TlGlgJ+48RFMOXmQgbPDiDVztrzuXRdf8yXulhABRQtO+k8Sbh?=
 =?us-ascii?Q?hbT7vqrXYJOrzye5/W53NUtA7VkjjN5plPbnmkBBduO7ztaBMmhwxFJfDdck?=
 =?us-ascii?Q?xx3mOHR1M7dlWyqXLAAIZTtqmKbrBtxjczJAvh+zNGSkWBe8XXafybVt6GXT?=
 =?us-ascii?Q?qqq59aM7UskOhMVRIsmk2CVq0x54jr0OB2TUTrVmC4wxu6GfVyYxESn4dXvf?=
 =?us-ascii?Q?mghVgSDOdA4m9hLQJTMJ1wLNVGrPRaS6dOv78Qcogphoqa7F/oYzg/XDc7Uy?=
 =?us-ascii?Q?ttnGHR7BCHf+ee6F3o3OlyRo0Cbs2lZRnHbzfNhXKrL5k0cETf+nZNLtGews?=
 =?us-ascii?Q?3SJ1eGVpj8gSvJ/yZutlwZcqf70Zhxvr2v+rURU5JEPQstYgLzPzJ43IuvGA?=
 =?us-ascii?Q?qFRtGTztrOW487qFu3V5RNY9PgTPzECG+r1pLnh4ilWy9qAdom2vQ4+9dk+x?=
 =?us-ascii?Q?KsVyi6I8fpj2mDnRml3McBj9JriAaddKnmd73brViMraz9s9NNfWAZdd9mw+?=
 =?us-ascii?Q?Z28kHQWi8JpOWunOMYYoBDMfmNmJkad16MtXSVdtnARhgZLk7qqRknN/w+Tn?=
 =?us-ascii?Q?EIFZzXopbFJUvNMlK8QewhMNF6JC3+7tIKGPRMjNjnb4RnqZYvYaWPK4ym33?=
 =?us-ascii?Q?2A/Xm3QVfRpdta+j4S4Safpf2w95GeAbSCELmlbIHEJj4fReeL8CDB35TzQJ?=
 =?us-ascii?Q?dfREgedL1t1lTJLtQfwNKgg+wo1Qj92Alde/hwTvx8yiwjIqjjSSQZKIqdLN?=
 =?us-ascii?Q?0BxLGuZdQUGiVor0y/+j6jEK3juznWtgjV+5kPUZZZWJJpcS6upr1lfcEIrm?=
 =?us-ascii?Q?dlFYIh5gUJanKz6GXImXO+eKdtH0Eq5zHtURh4w0j9e9UkPQcBSjt7mEJ9a1?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pc46lfmLpZNJcafMOSX/e2yIE05Rq3FEcJagELLHbTL7omos3Un17yK+k3mgVJaM+UWLflOk0D9k1ELn9wh//bBP8vHxL6onhYhX00YMK5gzXBty3+v32RIb0mu/JgJeDvhvfWD4YRrVo43Vzicm8+xsWaCJ7dEVmSr8DJ8X8uJVuac8xBp6yvPD6VwQQtXzwI6OHkjfFpS3agC98DFtLdncXLcUZGrt2w2IJgWxTZO/RU+/rJAaRAFXJxq+NLcw2vDlc415PNo+ijiNzoOoNWN1RZyPo3qjO1V7tlW0eRFBJdn3CPZKFrMAebUaEqm9+UAFrvaHbLQssLJ50ZpEG2aK/r6nj6GjX8TBAS8lQZFPvR23ns12EW0NdWt1l5XNHVMOQEgV/1dzq1oUtVbhH7J1kAv+co0HZdBUgNv4KyiQmLIRt9PjSN6RzNN1UjNF7sOlzWlwe1M0xP4EihRhhH2tDEi/5jdfbbcDy4k0D4xb/jMmKyIFXpE4Gg/S8st6AO5ciROI8PWwzSGQIVGLrL1hTs1usZoR58s6RcD2+1CYsDOvFjaR4fQ5weMO5HeUy89ar76LRSU5tFmPJTuoeoEeZlgAHBanJw6k6U0oPsg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41a3bdb-4dfd-4b4f-d83e-08dce19591f0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 21:19:29.6290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxvN9gCPjMp4cKbvXAUu4ORgRfFFvat7Iu02ZJ3Q7N07NEFbkieZUicYUlfPdopRcAk6kzOrDU+sv+LdXIU2QPG8FLnf5mCQsFPLJKL6zT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-09-30_20,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=831 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409300152
X-Proofpoint-GUID: yXqDbN-n1Yd6Z2Fi-pbfpb_Evkcx2Z9W
X-Proofpoint-ORIG-GUID: yXqDbN-n1Yd6Z2Fi-pbfpb_Evkcx2Z9W

On Fri, Jul 19, 2024 at 05:34:17PM -0400, Kris Van Hees wrote:
> On Thu, Jun 27, 2024 at 01:38:56AM -0400, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

As far as I can see, there is nothing that uses this anymore.  I suggest we
ut it in cold storage until there is a need for it?  Alternatively, we could
turn this into a patch that adds support for all possible operations that
could require relocations like this, and introduce that to the tree instead
to support future uses.

> > ---
> >  libdtrace/dt_as.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/libdtrace/dt_as.c b/libdtrace/dt_as.c
> > index a634b855..4b397f51 100644
> > --- a/libdtrace/dt_as.c
> > +++ b/libdtrace/dt_as.c
> > @@ -280,6 +280,7 @@ dt_as(dt_pcb_t *pcb)
> >  		case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
> >  		case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
> >  		case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
> > +		case BPF_ALU64 | BPF_OR  | BPF_K:	/* or */
> >  			if (idp->di_flags & DT_IDFLG_BPF)
> >  				brel++;
> >  			else
> > @@ -492,6 +493,7 @@ fail:
> >  			case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
> >  			case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
> >  			case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
> > +			case BPF_ALU64 | BPF_OR  | BPF_K:	/* or */
> >  				rp->dofr_type = R_BPF_64_32;
> >  				break;
> >  			case BPF_LD | BPF_IMM | BPF_DW:		/* lddw */
> > -- 
> > 2.18.4
> > 
