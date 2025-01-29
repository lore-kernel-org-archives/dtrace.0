Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048BB6A33F
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738133164; cv=fail; b=DU39wPu5O4zM4/j12uzUCvwb9Yyzs4WSUQuAkmXAvqXf6ued+8e73iGuO/c3H9kalSc2whReDjE7+DCHV33CiszDKaivkMakp7LfTe6TWXFsSZRyoCVVe8DNM6jbYhUSgA2BG0oSsKTGevmwST9QfsQp7fv9NTZsA2MquxL8lrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738133164; c=relaxed/simple;
	bh=tcyylbZSJa6hdBH22Rshysavamu6vwjLlZgAZmRyh10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p0eRMX9rslE38GG+6iWVkjMCGwaCwLuMnSdlK71Er/6l9WydmAB1bq9nCdAGU9CwPe3I3T5ToZacuSu8suAHHw4YKfwF8d568/rUbfRArZwzq9SOyNX2efa4J1U1FIS4kb55mTS4/uKtFI6t4t/o0nshkE/S5vTsThAjKaNbZhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cOmKJqVh; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XCsoKWa8 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cOmKJqVh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XCsoKWa8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T66vvQ031244
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 06:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=9a4RxC1zO0IrDsdHkm0RQ/8MPhI8h9z5k0BjHAoP9oQ=; b=
	cOmKJqVhcySATeNVqjK/rrfYyOrZQpCF5c2MqJIaU7jlEih4q7MDJYyZxUy/usAp
	gzRzY+PMUjAfYAzq3MRDkoWFc3ZeW33yrPAY1nMw7X8+gdOIp+UiP6XF1QUS57D0
	JeK52Gv4yPYjyDzwE3cn1Oe+dEcF+Qd5nlCkREJ8nofyrXtsZkC16aW10VNzHy3c
	9ECaNgKvVZHhMYiBsW/cmc/+27aH2BnUMbinFAtB9NRWNEwOq7q8dg+rpkPoy40X
	GKla4ESvTbuEslmxoqfsAneNiC9Ykg4JOkG2V7oO3QkQ03XKmZgiJPLvN5PusHDu
	8OXHbwvVwR8Vir9JtAIy2Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fes982hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 06:46:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50T5M07m035982
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 06:45:59 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdfchnd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 06:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqfyX22OfvkxnSdsEaz+lr8d6EnsA7LTPwcHEpoJSctVHeBbkf7nwhV9tTYfGPltqOCzOQW6Osuj3kOmHUr/bYDiebjMm0Q/Gh0KECnSFFVqyXOflJ/KE6fe0wkmsyD6SBq+G2tgTodIOat/bdHebbh7RbjfXYdhA1jBDkJBZ1xbkZu28uYLnWfZCdRixOSLSNFH6mRzHbG6CVjKDWGh+uQr4Cf9d6rRqjCexCBxt3d4GlBZXWhO7dSxBwDzLfw6Fk+Xi4e33BnzMeJPcGnNjy/hMRXUgOo4vaBvdwZqLAqNOLkVlqm64JgTyzFyxibfYPt3bOsxjIfDO/LH/s6bzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2uv0cl5XLGscaE8oobaIldtFyqnYUrZY8J1Ht87AZs=;
 b=R3GFjYqARAycW+evgOFeeFVlhO0Mqw96QhzT7CXInqndwQGKYZRpPiWSw/qxwsWU1Op/w6hLvptqw2Td+GYFrMc8/cuXeWVFdf3+b6hib823k+YXqlqLLHHKXDmIBx/iVpOCawCBnu/i1gbmnQESJ9tx3QH29mFI1JZ+JSKHVciCmMK3XAm7GGPTr5uD/Y9KkbtM4SG9cxfKPmUV/cx6+U/zgXp8Ry9YRTe0Y9jBsMvzZ6mYT62sXhn4Scmdo/tSS1M6zDF+lUcBCreU0bx66MtC7I/Hn54tlLg9Av0ONRGsGuv74G6j4xiaGfKCTaKOhP3V0Tj2dQ5gbnDIiRNszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2uv0cl5XLGscaE8oobaIldtFyqnYUrZY8J1Ht87AZs=;
 b=XCsoKWa8Sw3PXg4dH6js+CNksDB8F4rCLXLmFfTB7rAc98wJVpbqMT4GVRVUNY88fDDC8m+7eOwE7snycDac9uWvLomSaVwzj3sPGItOPC6wliFErqpZ26q8NQUROQTTSCMlI+DA0Yu5LBU4JJs+SiwXTg8zvAaVHzmUlStQ5Ms=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH3PR10MB7764.namprd10.prod.outlook.com (2603:10b6:610:1ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 06:45:55 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 06:45:55 +0000
Date: Wed, 29 Jan 2025 01:45:52 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 5/6] procfs: add 'execargs' global variable as inline
Message-ID: <Z5nOoPF05zuDGWr2@oracle.com>
References: <PH8PR10MB63378175F68DB1DD5D55463FC2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <9164adb5-a6b1-a7ff-530c-6aa30fa57be3@oracle.com>
 <Z5mY0VUgun8jSNq/@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5mY0VUgun8jSNq/@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH3PR10MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 49922e13-3173-46a8-56c4-08dd403094b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?VOLFjrzSKK4tZ+2rUP2e9P68y55bi+QKZWyeuoqLjwFytRNCV3IrPfJBFj?=
 =?iso-8859-1?Q?rgssEoM617JUY/u1jK5kPr5wfRjdKcJPeaFcJ38vAesc4ezPJ/nZKrmCwt?=
 =?iso-8859-1?Q?KJkYydJFFvuZQXD3pU0L8bLdwETtGNQhIuHxkRhezy4qQTTyx5JdUFSeN9?=
 =?iso-8859-1?Q?w8PGVL9xzRfAkSfGnRdfglf0Miio+sDIGsm2yslRBHa5yehBEDRr/W1uXI?=
 =?iso-8859-1?Q?pw937yaA8CPWDQvsJdvueFTAmVXaTpo7KySeO4jnE+PFpItkVpORPd05Yw?=
 =?iso-8859-1?Q?z2FWC/UK9D54xci4EzpDunW5N1d3lVCEOmZkQHw6ls3N3tFXWSI6c7cPn1?=
 =?iso-8859-1?Q?mQm+258nCJo78c8Nw6yND6N8po0FaNoOgovem1SiZZMdilC1mESVXiagKd?=
 =?iso-8859-1?Q?KAlaYYiOr54bM5T0dF1JZTqo6OYaLhdjBSqNN9w3j/2LDU6Li2BNUseN0D?=
 =?iso-8859-1?Q?h+ov7F8T9wl7iN6gh8QlFtt7Ha1nE3+93edwnV9RZHTyeA0Hp3aaJIT+1K?=
 =?iso-8859-1?Q?P7WtCqFveqBiyX6CApRFldx8X/bb0MDuEoxmduSeOi1pI62h1YFikFgax1?=
 =?iso-8859-1?Q?RKLucDWBHCrWfzhxLGcAGXRIy4qFUkkrqkD3kRnUMowwESFURTxxkM/kMS?=
 =?iso-8859-1?Q?Y1nm1rQUl9R7lf3khs5VK2dYUAcjknQsad0Fm7xuQPRDQVNdgK8dxDhTPu?=
 =?iso-8859-1?Q?6AdFkPMCMM/rSp28+tsqoOTCRMyjrFpw2hhYWKggH6IFLtZ5CzH3Md6BOC?=
 =?iso-8859-1?Q?5MuSaQdcixyfJljhcqAxZiJh9Y9YXBgdoP+y/XIElmgDwiKPRaShVlGiz/?=
 =?iso-8859-1?Q?5l0h2uus7deGgwT9W9ri9Daah5RlO6UEb98qWLQJzNv+25AOtWSTFOwDxg?=
 =?iso-8859-1?Q?RjhV2LJ6tyRMRyENhF7Qezgx+0BV93hF34zXyXsOe2Yw46O9BHoUY5/b9C?=
 =?iso-8859-1?Q?bkTrHO9j3S78AqsAcVCW8hvBmK/AuwLDbgOQr8NJVwdMNyOhhdOlPzUXtc?=
 =?iso-8859-1?Q?Ix2tZchIrznbYZCheO7aHCFQrRRl8dg9rVr+fTzVjXgwyylMY2/tXiHL1Q?=
 =?iso-8859-1?Q?9n3VCIr6bMaHIzv0JqqpleCuXCTclltkZF+MbMphdqiXt/FrTFIgfgScbz?=
 =?iso-8859-1?Q?1StsldXuO2LezQrQG3o7XeUEECtEUXuqfYrMsS33qWtK2Rael9gBBvG3Nk?=
 =?iso-8859-1?Q?U1ADsZgq3asz/+pxkOWQ0dcPaTUEMEPEGeyaUVxyTRAtUXtoIIjO8rakkk?=
 =?iso-8859-1?Q?ItGpdOFh3ENcnR3WRY9P8OkreLIMxQvdc8xPcr+65ORYWq/oqRPJw+VUwM?=
 =?iso-8859-1?Q?NTpxp1F18YpqzjUO2m69XZ5M6nqTyz1Kb+8nbBeyGj9B3vv5o/rW4YGKrN?=
 =?iso-8859-1?Q?/xHss0jKHmrDDhXLRBaRa68dwyE2xXrPT8aY0VOtgDW+10rSxvudL47iJh?=
 =?iso-8859-1?Q?1+R/LyLnuSNvhRxy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?0/Tbmc7z5h/zOgL4LvLrlZNoNek/jGZ/iG2eiYVxkTRfD+7aRzWcLkHcG2?=
 =?iso-8859-1?Q?qS9DsyKFp7wKmuErrrPjEEMAlUo3PV51ZeSyrPiqBHIMZIjZBDfhbbB8nK?=
 =?iso-8859-1?Q?ghGqQAzZx1H5jE/J+36uBG47G7z7aHxcuyqYjFqWJSC2gFeO7gCYSjWaqP?=
 =?iso-8859-1?Q?9H4YqVyu/RiupoVNUh0Axo9MBW7kM4KC7mFGIcXfJzjrpzQH/MQ38v9pgT?=
 =?iso-8859-1?Q?oE2MSS1S/vrVKykwgr8yfll28qilCfCangsiMqBgFA8YQWYXatRzce5vz4?=
 =?iso-8859-1?Q?8Dq0cAPzXi3rCZE+KCfYEbXDJVmwT5gNz1R+irWSznvCRzSIRq9iDAcdNg?=
 =?iso-8859-1?Q?0VCT68UgqJWTMjzWESsOF6dgoepwYubb4b/PxG9lvRfCV4XLBpkS8ZWV33?=
 =?iso-8859-1?Q?EWnBCLH0zfZWUG1nzEJkWVHWR7ByNcpmzxelaqK5E4JFiUbesAFDPkBzbN?=
 =?iso-8859-1?Q?1+0BHijzTNjhq+Aiyelfcbx0ZZWJD/Ne6UJG3Rnzy3DHQuvUkvxUkZzoic?=
 =?iso-8859-1?Q?gI024jAAS14sVEvzQmOQXKq6iob3SKwuJ+iJPyWidMezrZl+wj4xgN3nlp?=
 =?iso-8859-1?Q?HgAG44zB0gHqbTywYx2Hm4otio7NAqr1yW1Liup3GId4n8p6VaoY+2VYLk?=
 =?iso-8859-1?Q?Wpy412nSC8CZ+JZQhkZ+g3FdSvKJzlSumRiudDL1a3Rle9uDe8QP+GsXs/?=
 =?iso-8859-1?Q?gL4zFaCsZXRPtCZcyCqQ1bysLx4Ehjjjcw0KpvZULJM7mSMM7MarR3oVEq?=
 =?iso-8859-1?Q?QoilOKmDcamcUU26oFw+lQI1xQ7JFZ4HVROPIlzs9Wuf62vDYYal1Qh8NO?=
 =?iso-8859-1?Q?vYNwzM5fOc1mhzr3eUXmhLNzP20DShLNsaQmqAON6edOvgtzmu/uIRMUcq?=
 =?iso-8859-1?Q?xT/lpm0kbrgei/BaWXDCdKghaiLAOrBHHjHHpVWhatzlImq9JbViX00u8G?=
 =?iso-8859-1?Q?/sIsljGDmBTB1zHllUgtS/tA8m+F4AN8St4+LhQofbqHDdyNHkdhHxhs3h?=
 =?iso-8859-1?Q?oMJhuPG1Z0Y6dq7QssL37/H5uRNEj8Wq2H4OGzeyozkmsSyTZ6iCMrOArD?=
 =?iso-8859-1?Q?OXU1/LqD0UeINBOUiQZpT//hNVYcCeytB/nxLKFmdTUKMiHAR1KgdQtDfl?=
 =?iso-8859-1?Q?MG6F7pdFUxque0HmRZpA3l6tj5NjLHFcu1h5ka0sJOciQYpnohSzeiLv3e?=
 =?iso-8859-1?Q?A4BNCDqK9vcyMXC+auI0HUu7iDkoJSErVB3SzAXcU+lX1NUNCsv4ZMMXZP?=
 =?iso-8859-1?Q?fGlCYAdhlV7LSgdwXMIIh21Tsi63Rz6Y3erMxuNZOhl40ZOPW2LwgGCDBg?=
 =?iso-8859-1?Q?GpQ2yq0hPPivT8imeabiVpVHCtDs1Z2VCbqsd+uLb8rU935UOfyQpe77Bl?=
 =?iso-8859-1?Q?7qvuiukaHXadRDnS6MUU/4uv553nxh1+8P+BMPSgu/4L+uta4/HIilN3N9?=
 =?iso-8859-1?Q?koswlIW0q4y0uGv/x2iAgZgK57nkDvYPkaQ+zwPNTUzZGH6NLZ48fHIORl?=
 =?iso-8859-1?Q?lOibTYCT49FkrjlAKl2LQHoHGOOX9plsOF4rTjfUpt2GsrjKOd1bAv/hFY?=
 =?iso-8859-1?Q?6dyP4nbgrpXuM1ISIJJkKzRqTX5b7RB8OVf91GkXK2WfnJpc0DoNm7B6np?=
 =?iso-8859-1?Q?2AmxKzb4R2BzIE3/L51NjD5d/Rj2d+Tqa7osMCTq15ZcfBCQ0RFMAaeA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tcGZpYRdlV7soD/ln0W3O92iwo72jG8rAIis+9vB6J+22jLwme6r0hCSvBsjFbBndILMDPiSzaPC55MbE5uy+wrFEb/Eb4q+8fi0MdrA/UMPviuecoMhIymIBYTMICJmvgVZCg+TB+WkWGb65FKKtbHFxYAuHu90KxXjJQdBRt/PG9JaURmbBMONrt7eUZD36ylhjhyxGPAsQP3fu9iD82TQdADA8rQ93C81TQrjeQm5fEFkJfpoDUph2itZiuyxvOCIfTjZ3TuMMQgW/5orMhqeUPBOXhuVj5uY87eC7ZOJoKO/iEwGAIzTkdvK7rKwPhTz6uM01xWjzf6xZqQP5JOhQHOHlMtXzqYrX5f2sujbfYw10QY25o2jIGQjuO3TDzBfZvEDsB5dNU71njK/wIBvzUZgHpMs7bGfarYGe4huKxDpLwxcAO9Hit93pZsZLY/D6lLX2PQ+xjrhojeW5jskr5K2F7To1GTz5tQBP+UjddfbZ88Pbn7Bt7G6/Fl/4sy37ve1z4pjosEkO64bgzsAMrdDwF1iVJGpeEdzTA94Y6xzJ1DP2Te5A+YGPltGuEnWOzBny6Teib8S0c4FatNT/uRnrJqCMk4nxh9dn8I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49922e13-3173-46a8-56c4-08dd403094b5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 06:45:55.5753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaUBkB7WMd7B8fn3GMN6REWkq9m8gSi5gxeySER1TOEb+4A7tD5bYTlfeaWTymGIGL3R8CifIKwKPFqLXx55nlVeqeooHlEirjZLQoz8Khs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7764
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=802
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290054
X-Proofpoint-GUID: sM8TuoyMEYYJXAAUXBp4OLQKxo11uNyc
X-Proofpoint-ORIG-GUID: sM8TuoyMEYYJXAAUXBp4OLQKxo11uNyc

Actually, I am withdrawing this patch.  I forgot that we have curpsinfo as a
builtin, so execargs can be obtained as curpsinfo->pr_psargs, so there is no
need for a shorthand.

On Tue, Jan 28, 2025 at 09:56:17PM -0500, Kris Van Hees wrote:
> On Tue, Jan 28, 2025 at 07:53:51PM -0500, Eugene Loh wrote:
> > I'd like a little more context here.
> > 
> > Features:  There is a new execargs global variable.  I take it this is new
> > to D or an extension to the D language?  Would it make sense to call this a
> > built-in variable?  Are we also exposing a new function d_execargs()? 
> > Shouldn't there be tests for using execargs or d_execargs() in scripts?  I
> > cannot tell if we are adding new user features (which should be tested) or
> > not.
> 
> Yes, execargs is essentially a new built-in variable.  It is defined as an
> inline, simply doing d_execargs(curthread), so it is a short-hand to get to
> the pr_psargs info for the current task.
> 
> So it depends 100% on the d_execargs() implementation, which is a function
> that I added in order to implement the psinfo->pr_psargs translator
> functionality.
> 
> > Testing:  I see that the following patch (6/6) lifts some XFAILs on some
> > pr_psargs tests.  Should tst.psinfo.d be added to them? And should the
> > removal of XFAIL for test/unittest/builtinvar/tst.psinfo-bug21974606.d be
> > moved from that patch to this one?  And should there be correctness checks
> > for this output:  not simply "does this script not blow up?" but actually
> > "does this script produce correct or even just sensible output?"?
> 
> None of the existing tests should be moved here because they do not use the
> ezecargs variable (since it is new).  I'll add a few tests for this built-in
> specifically.  I'd be happy to even drop this patch and not add a new
> built-in, but it seems somehow odd not to provide it.
> 
> > I'll look more but am certainly unclear if we're talking new D features here
> > (and if so, why they're not tested).
> 
> > On 1/28/25 01:31, Kris Van Hees wrote:
> > 
> > > The 'execargs' global variable provides the psargs for curthread.
> > > 
> > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > ---
> > >   dlibs/aarch64/5.11/procfs.d | 4 ++++
> > >   dlibs/aarch64/5.12/procfs.d | 4 ++++
> > >   dlibs/aarch64/5.14/procfs.d | 4 ++++
> > >   dlibs/aarch64/5.16/procfs.d | 4 ++++
> > >   dlibs/aarch64/5.2/procfs.d  | 4 ++++
> > >   dlibs/aarch64/5.6/procfs.d  | 4 ++++
> > >   dlibs/aarch64/6.1/procfs.d  | 4 ++++
> > >   dlibs/aarch64/6.10/procfs.d | 4 ++++
> > >   dlibs/x86_64/5.11/procfs.d  | 4 ++++
> > >   dlibs/x86_64/5.12/procfs.d  | 4 ++++
> > >   dlibs/x86_64/5.14/procfs.d  | 4 ++++
> > >   dlibs/x86_64/5.16/procfs.d  | 4 ++++
> > >   dlibs/x86_64/5.2/procfs.d   | 4 ++++
> > >   dlibs/x86_64/5.6/procfs.d   | 4 ++++
> > >   dlibs/x86_64/6.1/procfs.d   | 4 ++++
> > >   dlibs/x86_64/6.10/procfs.d  | 4 ++++
> > >   libdtrace/procfs.d.in       | 4 ++++
> > >   17 files changed, 68 insertions(+)
> > > 
> > > diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
> > > index 70a43ddf..9c06fe1f 100644
> > > --- a/dlibs/aarch64/5.11/procfs.d
> > > +++ b/dlibs/aarch64/5.11/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
> > > index 70a43ddf..9c06fe1f 100644
> > > --- a/dlibs/aarch64/5.12/procfs.d
> > > +++ b/dlibs/aarch64/5.12/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
> > > index ef27bb70..2824d137 100644
> > > --- a/dlibs/aarch64/5.14/procfs.d
> > > +++ b/dlibs/aarch64/5.14/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
> > > index cad2d2c5..daf30745 100644
> > > --- a/dlibs/aarch64/5.16/procfs.d
> > > +++ b/dlibs/aarch64/5.16/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
> > > index 6b1b1b9c..3594e5e9 100644
> > > --- a/dlibs/aarch64/5.2/procfs.d
> > > +++ b/dlibs/aarch64/5.2/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
> > > index 70a43ddf..9c06fe1f 100644
> > > --- a/dlibs/aarch64/5.6/procfs.d
> > > +++ b/dlibs/aarch64/5.6/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
> > > index 4cb7b77c..2d52f079 100644
> > > --- a/dlibs/aarch64/6.1/procfs.d
> > > +++ b/dlibs/aarch64/6.1/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
> > > index 4cb7b77c..2d52f079 100644
> > > --- a/dlibs/aarch64/6.10/procfs.d
> > > +++ b/dlibs/aarch64/6.10/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
> > > index c2be76d8..7679db2e 100644
> > > --- a/dlibs/x86_64/5.11/procfs.d
> > > +++ b/dlibs/x86_64/5.11/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
> > > index c2be76d8..7679db2e 100644
> > > --- a/dlibs/x86_64/5.12/procfs.d
> > > +++ b/dlibs/x86_64/5.12/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
> > > index 28fada6d..3a348ebc 100644
> > > --- a/dlibs/x86_64/5.14/procfs.d
> > > +++ b/dlibs/x86_64/5.14/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
> > > index cad2d2c5..daf30745 100644
> > > --- a/dlibs/x86_64/5.16/procfs.d
> > > +++ b/dlibs/x86_64/5.16/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
> > > index 08696cf7..6ad926ee 100644
> > > --- a/dlibs/x86_64/5.2/procfs.d
> > > +++ b/dlibs/x86_64/5.2/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
> > > index c2be76d8..7679db2e 100644
> > > --- a/dlibs/x86_64/5.6/procfs.d
> > > +++ b/dlibs/x86_64/5.6/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
> > > index 4cb7b77c..2d52f079 100644
> > > --- a/dlibs/x86_64/6.1/procfs.d
> > > +++ b/dlibs/x86_64/6.1/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
> > > index 4cb7b77c..2d52f079 100644
> > > --- a/dlibs/x86_64/6.10/procfs.d
> > > +++ b/dlibs/x86_64/6.10/procfs.d
> > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
> > > diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> > > index e9d50349..827d6b81 100644
> > > --- a/libdtrace/procfs.d.in
> > > +++ b/libdtrace/procfs.d.in
> > > @@ -307,6 +307,10 @@ inline string root = d_path(&(curthread->fs->root));
> > >   #pragma D attributes Stable/Stable/Common root
> > >   #pragma D binding "1.0" root
> > > +inline string execargs = d_execargs(curthread);
> > > +#pragma D attributes Stable/Stable/Common root
> > > +#pragma D binding "2.0" execargs
> > > +
> > >   inline int CLD_EXITED = 1;
> > >   #pragma D binding "1.0" CLD_EXITED
> > >   inline int CLD_KILLED = 2;
