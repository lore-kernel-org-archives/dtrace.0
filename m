Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95E274B3B
	for <dtrace@lists.linux.dev>; Tue,  6 Jan 2026 05:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767678916; cv=fail; b=FKzi7WdfpVCe1vm5FHPq8as+jNcADew96i0jFtdIWO7xqJ1MUT8/FtOgRQ7cpZmgz8sq9Hg/ikaVG+Vrz8d6sd0AvICNuzBQsZH6oMvzypmD8vo+V6G5nYa0pzzjtTkx7d82MEgTmUcKZrD/YZGbYRNX+G+yD91rAhU93AcKW54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767678916; c=relaxed/simple;
	bh=HHj1it4+PBoqphI/Ww9oaYzkm/lHU6IKDPgbZJBcY7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iyt72QcFCHXDh4m6qrWRzo1iyBsgUU398pk004KlT9KtNtzES2vtFfGg/P1VLfqaNc2rio5sRXG/jZZPFfvBYzuSUB3TEiQhlkHh+iPLC+cPc0337QsrgrQDUKkZ01S4fwGpmI445Uxq617EbgV7Jzq/yniXQez17140h8xZdSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NPZlDy2C; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j/JOpMyr reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NPZlDy2C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j/JOpMyr"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6065pWGt2882774
	for <dtrace@lists.linux.dev>; Tue, 6 Jan 2026 05:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NdL59XLXOya26fLhiPsO0adIDDCNhsxSEHU1LHBVDgw=; b=
	NPZlDy2ChTNZ4SHb0QmfhEGnLFt+yXILDoqLoVq6wtMivVl7sZu3v0MQfmprhAHL
	GzEzR2OwqgwXVer0SoJJ7LsGnqA/uec1iUxZe6syOAkuVwX2UsCW4R5GI6RJv73M
	n8EJJsxbNjsDg7+1URFWLXo4SYDUDYAVHuKvVhLM7sO4djCavKvM/JMmfaVhTOyn
	vcGBN5pdu5jW8WheyCrkqUWqXmW88BYNY2bMFxlNF4zQr6s7PFaGM4j53uwJx0aV
	aRygoKfb58icLZA5a60pIx4LaN2/Z6M60OH2X7SwA4/hUySh2wChGDzcQP9iv7wi
	qhe8MtDvOeDUk+hfuBcXJA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bgvm70038-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 06 Jan 2026 05:55:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6063IekX020429
	for <dtrace@lists.linux.dev>; Tue, 6 Jan 2026 05:55:06 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010004.outbound.protection.outlook.com [52.101.46.4])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjj7d60-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 06 Jan 2026 05:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0yPJZ2QWpw2Kl0njgrMg7IOw7h8sWbtEMfFn5Pv71SpIhlGkwQkJATdemqDEq0Fm/iZ2bSNcjNPMENrNZeHZm8n2Pp01ybjwosNhsZRCr6f0B+laAYX636okpJuvtoh99lyoPcBhbDmmYj+cliM83c5HSDz/t26AQfy2vZWff2A4Ws9d0pm3VL4l9zdPWBo8fjhlJ8+YC/Bky28FELBN0PGECQ2BQSzKfMP/Z0uW7lU1EDIIzQGTkUUKN8iZ0ZYiqmx3DaK0xoMQMYYZofSLuhTerwt41P6kvZrAEnx5WfZoHQJp/a1Mpo4bGzm5hsFuW3Eb5HrSNJijLQxMDK1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29w4LVrMDD8/sCvIi7m0+drsf9tLQ6OM+px1eRHpnOc=;
 b=FQFACqT+x1Poai5YgJNrW57aV6t3w+lOp5FVQFMVSzfokk4G4RC54LXo/xj7WAbJS1ds/2mWE7xRjSeT/Rg9ISHEk1QUwqeDVQdaKeYjHr87F94jN5eGdW81zq8xfuQPwylIUJEDdGvqFrA7t+wXfFG0J/np5v5XF0oE0qleP5+Z2jAAbVaNJXBU2DxUitVcgLT7K6XdKN3hq+nj0autfbJz77It7VZXrL5NgEkOMmiYziKimvaWL7o04fG39YZ1c3YKOSF/sPeY3hAGxqiB93T91n+Nw0GzRo3yH+UnXNnTLWbr90obkpsF0SPfzUPEKVGxXCGgglVRs960RThPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29w4LVrMDD8/sCvIi7m0+drsf9tLQ6OM+px1eRHpnOc=;
 b=j/JOpMyr52V3mrLloA77RwYu7Gv2iUJxYlO2VqCgG88SJPNG2cw396aPctmVIrszdjllhILTX0sihzxT12N2G3Oq2KkCiTrWhZ6M1wbr7ApMaEMnr+r8dPwr2y0mVTVxdeO+4QgC3VEOYgBzGj/N+QiSyUMXTtuxsmmcgNuQMcI=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BLAPR10MB4979.namprd10.prod.outlook.com (2603:10b6:208:30d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 05:55:02 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 05:55:01 +0000
Date: Tue, 6 Jan 2026 00:54:59 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 2/4] test: correct file permissions
Message-ID: <aVyjs1kIbPaulblX@oracle.com>
References: <DS0PR10MB7522B2CF26246FD7189562CFC2A9A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <e872e514-608f-9e06-d05d-146284b27fca@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e872e514-608f-9e06-d05d-146284b27fca@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BLAPR10MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 7561bc7d-abe7-4217-a441-08de4ce8219a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?yvaDjFPcPR3PidnHb/WDATz2429cAauhO311X9/dcK921ChQSVcgDpU4Vs?=
 =?iso-8859-1?Q?jOF4Tp9Y+Wc6AJt2MisjO/J7s2zlSpt+bkrEUqhnEXLIq4bX/stVMEyFKP?=
 =?iso-8859-1?Q?1hMDgjN9AKYCILzeOO+xb/QM0On/RMc4MZSI05RPPRTrFA/B0ls7Dp8wQl?=
 =?iso-8859-1?Q?kEJDOMTWfwunmAI656W0pcKWAVY19ajLYpDbC8r+uTUebmjoYKGgRuKfFT?=
 =?iso-8859-1?Q?DKDScPHtpa7E0QNUNTGqUUGFH5gpN+01u5jymkrA7RZ1lgzvS09eo1SIIz?=
 =?iso-8859-1?Q?T/cp2O6zNkE7r+MSnGwn8HVTjg717JF5OW5+KHwx00Ai9kLivfaF+CnuCY?=
 =?iso-8859-1?Q?YC+USpq/1aAxR2yRiqZbzaBrgwZOtXJCeEHALlNB69G1BdAIGQny2aRItH?=
 =?iso-8859-1?Q?Rog/7SRVGeaRIRTulPV/KF9nRR5Iz/hBWQyZ7MEbh3SfdDhTIeCV/jF8Su?=
 =?iso-8859-1?Q?gYtzFj5/XeGujAXTyS7RqgG/KQbO+a5ZrS8yGR7Gy+gKXaJI78bZYXHg56?=
 =?iso-8859-1?Q?SDMTw+NljHfTo1tYmfFOPRotpxAmwJlym2hCPV1v0I9M3UYCcdCaNy7NNR?=
 =?iso-8859-1?Q?ljKu5KReG10bJeQ0StSVU+o4Y8BVQ2AruoaI/hBpHkNfuTFheQ5pHn37fc?=
 =?iso-8859-1?Q?XQKyMMm6jZ6MSpVk9HwFsnBfksELlpBWQZ+e0L57O6G/GPlejejm+zM75M?=
 =?iso-8859-1?Q?aCsp+exQrUCvPh9TH2KiM6GyVXUwovhdfDNlv0Pkq/vIspcAot0DYgIGyS?=
 =?iso-8859-1?Q?mT1ygvL+pt+yrSbzHoCbG+jDJQzKW2BmewqQgabDXgYEm1wNpmXPadrtyN?=
 =?iso-8859-1?Q?Tt3rq6e+9l60LuL7I1V/wVauE5PR+WngYVBbfJAYFfe8B3nJkN2+SX2Q8i?=
 =?iso-8859-1?Q?jh2Fp24FtE1L0YGnOqJR5GX3PzOHBi0ysFKvWEjaNm/EVElq5v4TbiXg9Y?=
 =?iso-8859-1?Q?+Y36vLVXKQmf6oGxfNm9fvI+r+YApdAmbg3stvzCnBwaEhG+4UNGu+8YTc?=
 =?iso-8859-1?Q?RFuyIrDUMZi6Jbp4kPCzuTUfHi5GUv7s20W3WgZG+1scCh9o3LRgNR0eU+?=
 =?iso-8859-1?Q?pB3s4bRy+fLNiA1mzELubeCUVP/prFBmI9LBokH3WOOV+j5tmfIgWiDYOK?=
 =?iso-8859-1?Q?xdCMVZKH8IoPlb0knYJLhlYAldMx78NN3PVpUgmdEZsDHKKYti1VV4Au4a?=
 =?iso-8859-1?Q?LMqmLDLlMSecCbfAjaBQvKdT+zd7m735/ETjTU5mT3Oj9nKYVfqhsSR8ll?=
 =?iso-8859-1?Q?hIdbf0w1L9Yp7EZg32CiVScrvfC2DUt6wX0rrks0IP44HvMxwJmc/kI2Se?=
 =?iso-8859-1?Q?s4I+HXH/lZldtSMxnr96oD8nKWxSqzlccl9WLNtCtUc+xNy5RkmmSwhK1E?=
 =?iso-8859-1?Q?M/RgqRRPCeLKRM+UFnj0/QVanAM3Nh0tIykMuDaVW2YhaiklwuMiqp1T79?=
 =?iso-8859-1?Q?9sgRStKswaJkpPyDyGQ0EbNidM8oQh1cT99tdju7WCRbDKaf86BD4lCa0/?=
 =?iso-8859-1?Q?Ol0tnAoOWkzzIMz+KtP15Pihlpc+j3FNuDZlathGL3nQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?lpULWL1mDACPypqO0ydbmibr6GH62fGu55s2hU7SoNe9ZPdmWvCSYFEaLV?=
 =?iso-8859-1?Q?pNMAHFhRrlQg5KOArL80Kknje+iy1WDWlul6ZdikYT/cBXmz3YSY6+KTu8?=
 =?iso-8859-1?Q?Dd7QBalmKB6bQL5uGuzTmgcWKg4OKInuq0zCzwdY0Z6bZpGd+nfzrq8wkz?=
 =?iso-8859-1?Q?aY82PYZE964ERr3wuXR1PTTyI2Z1AjKLqKYXcRmgvop+bP59lwWrqtpZdL?=
 =?iso-8859-1?Q?dovEU8dubi5p5lD1VUU/ycp/N1e4elWPAe+YF7Qmg8pFx+EGroAN+98RcD?=
 =?iso-8859-1?Q?0bM5fjB1O06d/GSeM2WSmxatu+mnC183kglb2eLTlAn7FAmQwO3BKQ3Rq5?=
 =?iso-8859-1?Q?GWMIveJJ8xOlk4cnFhllJe48RxoLS03ysVD/hmW61J2qBB1Oi6pAc5htma?=
 =?iso-8859-1?Q?AcRvWgxLBcS7SQ0NvuclYBPJ4w52FnXSJ9mUoVuqWKzPGmnhU+/B/BXZO1?=
 =?iso-8859-1?Q?kV7iHREub7njgqLI/oACp208ez5ya/k1buIK0rNdLG/q3VfjLdrikiyOWU?=
 =?iso-8859-1?Q?uLxKY14qjK6fAKKUFFyI25stvWFLGcLsygKvNSOKYUYbFZxUQmItGp0jLE?=
 =?iso-8859-1?Q?ZK4oBuXb3OYcGgA6y2McycERhEKYq/JNvBK6trNYjlIlUoFMglD6eUf7eQ?=
 =?iso-8859-1?Q?eE9f+3aW6x6xTcceiyu3bGnjp22+P6ATEdIJsr45E+Es/pL5CRSE8d/W26?=
 =?iso-8859-1?Q?4mBbrOrIKQytubjUg3O/6xNN6TkC0pdSnDAbr/uHLf64fNlkUaYCJlktjl?=
 =?iso-8859-1?Q?eVt8PmvfGwAaf1LT25Qees/Av6jtbPIeay+NvuTRnposPzHJMkJXbBrGf9?=
 =?iso-8859-1?Q?PrN25y8aECchIkh1z34t7Nu+IyKH8q+m3tvyVXLYA6nDGBJmHFK7HmEWFh?=
 =?iso-8859-1?Q?rvUDaxAFl/v89T+3DOgZBjJyUzlY3gZVUXLKunv3JARRQ4MFMXIkHk288p?=
 =?iso-8859-1?Q?RdnUSy50NJvw17fFSfmE2c4OE87+5nhIpYlBOBfoqvDi2DAId5Apc7sq6w?=
 =?iso-8859-1?Q?9UEgtbB9QGZMkOiU+d7qWm5vyopkIoy/BZ+ZIWbpvT6gODg2dF2kqRjYWe?=
 =?iso-8859-1?Q?RvFN5DNHoFGiZKMIKi7sIzXkazbxEC3uHgDxUPZPPTKLADYiAKJdpM8WXc?=
 =?iso-8859-1?Q?UMg/s5mlCdnMboODyas/zyu5CQk0RnZ2WsF1P3dimVNFsCKTbvPcCXiji0?=
 =?iso-8859-1?Q?2tTf4CwCd6KZWm8FMFukatowvRnKhL88CQTeYDPtkHi9t3OMYbA8gDeXfz?=
 =?iso-8859-1?Q?CdLwp64dUmiIKzVhOmx35ebuKYH7cWHExlIGO9DHKRHlN/c0lymZ0N5msK?=
 =?iso-8859-1?Q?znDt4V8lNFfmvuN5h4+ISlcEZcH1pwpPp1rrmrCTbDj1JgYVvrk0Ez4V2E?=
 =?iso-8859-1?Q?om6ES87hhEBWayjMGVbObGw3sA9pbbeKEZwF24F06YvPvKr4yBJVerdAAA?=
 =?iso-8859-1?Q?FCKi9nMQXip613Ihw+9cCdco3EvCYaTsUh8avQVw5fJb8R7/bni7yp2jvG?=
 =?iso-8859-1?Q?6jzZADDRw9NudypsSuqgGiaNEJyscPRpyhC/oZEP5ws4SVeI0bKC8PG/Ad?=
 =?iso-8859-1?Q?Uz/qy3k25KF+JmrZyO3Q+xAFSJ92SrxTNdOv3j4CJN6I/RJMoNCwyUtNxW?=
 =?iso-8859-1?Q?rb562eaP8xZkqjVEj6j42ILMi3XVVY7yKlzREtNtkxwed47X0iAScefaBZ?=
 =?iso-8859-1?Q?sLqaNo0ZwHSdTX/vDhRvPpWiqkt9mzcJ8gCvAUfVCj1rgUrMIcyC4TmZC7?=
 =?iso-8859-1?Q?CEn2am8dcPjXXqXAS5tb27Bv9xR4QesPd2l922tWSBVdbZDqeKUhzQhl+r?=
 =?iso-8859-1?Q?RnrGkPx/dA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jB9zdHAMj5NSe/mpYQQF1vEN7j1hI/bP0vvskjqQQzghUj+9kT8HTumDCcDKmyumdGhvHAQTpz4LGjDnmoLuDDRd9eR4b9fP+UKWWuKMfPJ6SteeagVf0lbhNlUZgCBVJ3DJKirVsEFmUPZnU/OUeOtDfia7nUpJzKoDcqIo9pLsx1yK5kAAwa1aOZc/2eln4GmeykLdJJ9bFzwmOizYz5jHsBtHztpoQYyk5ua+tlcAt+DkI3tIZlzZTpTEgni0HER3x7PoxcevS8oJZ2eY3IZPX5tCHCEx4eNbCwWTllUteLA0B4YpwsePzFUqjhHr2GYedKERtsWc2QDwAw5eZVOs9owqAc01o+rhzS9b0oqMvinT42ci+65/hdZkqDGaGMR5ZU1+jY1of72hssuXDdNVfsSRXW5vPDa77cuhGq1jkLzki8Pm+clVXclqQOygX2LpUDHtfiomT0+aWQhX8ottBZSbh0knE4QpEVITtUer4szIpDoYR4gJsvtQIYE77ToKZy9hu1kOqm+O1AenwYGbhzGA7SYPWrhoqm4HP/00bgfjEti18GPwOq9giF+8QPqaskRJy7QaEEMobB+0FCK13h5och0SC3l25kN1lgk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7561bc7d-abe7-4217-a441-08de4ce8219a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 05:55:01.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fe8tDPv72/OdsweuV66vfdHYbBBH5JoLYSaXy7X5d0CThmjnOTrCeDKyi967RibCr4b/GEcX0fv1hUJQ4J768KhoikgZrE7uGHwQ5RQ5TQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4979
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601060048
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0OCBTYWx0ZWRfXwAqhmBdmRUiD
 GPtk/W96zqqtbWbzRLqfsJDz8fUKyNhOl5kbPnk7ovbIZs8PVAj2heuyomRoJj6xTBkyHDszO8y
 T2PihsveQlkd6H+hMtTXwp33Ek94O/kLnXw5HupAa14MCy9HSuWshBIXYEMHiTScV7CDJO+x5yC
 qvN9METnyBrZn5zazvFmaUXk7vyn3Qzh2BBOdf0ITV7swuOXT3ZYt+6U1cI15zK7OIc3U1I725y
 +awFliQeyHn1vpch7x7GSLOrfOK3kGtvTFDTkWDT1MBjiEQ4ibatPIwJhEso9TXuEgLdTeVJi/E
 4Nh07+OVLMnD/GbIeAT4GN5igSrrtki2DJ3ToIRrJRNHBOtwHzLb3owouilLA6OQVHaW0p+0XV+
 EfvHcy/fnesI3w53ffMgstvXJkVb06cIWQ/5jKHvQ2k2SR41nRFxliHTt3wBddytqbXsDPhEles
 FSXRsLkORnyaB/18ChbvhC4D7Fg80OK2uFarWPY4=
X-Authority-Analysis: v=2.4 cv=MqRfKmae c=1 sm=1 tr=0 ts=695ca3bb b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=po0uPWwWaCPDYVlxPxwA:9 a=bfNqE3XdHPVSVWka:21
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12109
X-Proofpoint-GUID: OPAJqz1Df5HtF--g7Mz2IZEA8eG3mlVB
X-Proofpoint-ORIG-GUID: OPAJqz1Df5HtF--g7Mz2IZEA8eG3mlVB

On Mon, Jan 05, 2026 at 11:50:53PM -0500, Eugene Loh wrote:
> On 12/18/25 19:51, Kris Van Hees via DTrace-devel wrote:
> 
> > Various tests had a #!-invocation while still being expected to be used
> > as scripts fed to dtrace.  Removed the #!-lines and marked the files
> > non-executable.
> > 
> > Various tests that were meant to be invoked as standaline scripts had a
> > runtet.sh expects standalone D scripts to use '#!dtrace' so that the
> 
> After "... had a...", is some text missing or garbled?

Hm, yes, will fix that.

> runtet.sh should be runtest.sh

Oops, yes.

> Some copyright updates were missing.  (Also, the changes to 2025 should
> maybe be to 2026 at this point?  I don't know.)

Will fix.

> Is it worth mentioning that some static checkers were demanding these
> changes?

I don't think that is really relevant, because the majority of these changes
are actually correct in terms of how the scripts are used.  THe static checked
simply pointed it out to me.  But the changes are not just to make it stop
complaining - they are genuine fixes (either for confusing things or for things
that really ought to be differet).

> The patch otherwise reads right to me.  The tests, however, are not happy. 
> The following tests fail intermittently:
> 
>     test/demo/script/interp.d
>     test/demo/script/tracewrite.d
>     test/unittest/lockstat/tst.lockstat-summary.d
>     test/unittest/scripting/tst.arg0.d
>     test/unittest/scripting/tst.basic.d
>     test/unittest/scripting/tst.trace.d
> 
> These tests fail consistently:
>     test/unittest/scripting/tst.assign.d
>     test/unittest/scripting/tst.pgid.d
>     test/unittest/scripting/tst.pid.d
> The problem for these tests is
>     -#!/usr/sbin/dtrace -qs
>     +#!dtrace -qs
> Since these files used to be invoked as scripts, the -q was ignored.  The .r
> files relied on that.  So the interpreter files should drop the -q.  That
> does not fix them entirely;  it simply makes their failures intermittent.

Yes, I caught (I think) all of the opposite cases where I added a pragma to
ensure that the -q behaviour was retained, but I don't think I considered the
case where the script was not invoked using the #! and that therefore the -q
was not actually effective.

> I'll look more at the intermittent failures, but there may be more than one
> thing going on there.  (lockstat-summary looks different)

Thanks.

> > correct path to the dtrace executable being tested can be inserted.
> > Corrected the tests, and ensured they are executable.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/demo/script/interp.d                                   | 2 +-
> >   test/demo/script/tracewrite.d                               | 4 ++--
> >   test/demo/spec/specopen.d                                   | 6 +++---
> >   test/stress/fbtsafety/tst.vahole.d                          | 2 +-
> >   test/unittest/lockstat/tst.lockstat-summary.d               | 0
> >   test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d     | 2 +-
> >   test/unittest/scripting/err.D_OP_LVAL.rdonly.d              | 2 +-
> >   test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d        | 2 +-
> >   test/unittest/scripting/err.D_SYNTAX.concat.d               | 2 +-
> >   test/unittest/scripting/err.D_SYNTAX.desc.d                 | 2 +-
> >   test/unittest/scripting/err.D_SYNTAX.inval.d                | 2 +-
> >   test/unittest/scripting/err.D_SYNTAX.pid.d                  | 2 +-
> >   test/unittest/scripting/tst.arg0.d                          | 2 +-
> >   test/unittest/scripting/tst.assign.d                        | 2 +-
> >   test/unittest/scripting/tst.basic.d                         | 2 +-
> >   test/unittest/scripting/tst.pgid.d                          | 2 +-
> >   test/unittest/scripting/tst.pid.d                           | 2 +-
> >   test/unittest/scripting/tst.quiet.d                         | 0
> >   test/unittest/scripting/tst.sid.d                           | 2 +-
> >   test/unittest/scripting/tst.trace.d                         | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d    | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r    | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithChill.d         | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithChill.r         | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d       | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r       | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d    | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r    | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.d         | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.r         | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.d         | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.r         | 2 +-
> >   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d | 5 ++---
> >   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r | 2 +-
> >   34 files changed, 42 insertions(+), 49 deletions(-)
> >   mode change 100644 => 100755 test/demo/script/interp.d
> >   mode change 100644 => 100755 test/demo/script/tracewrite.d
> >   mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
> >   mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.quiet.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.trace.d
> > 
> > diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
> > old mode 100644
> > new mode 100755
> > index be690b56..f4718a41
> > --- a/test/demo/script/interp.d
> > +++ b/test/demo/script/interp.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
> > old mode 100644
> > new mode 100755
> > index 0c139ead..482f272b
> > --- a/test/demo/script/tracewrite.d
> > +++ b/test/demo/script/tracewrite.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > @@ -7,7 +7,7 @@
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > -/* @@trigger: readwholedir */
> > +/* @@runtest-opts: -c test/triggers/readwholedir */
> >   syscall::write:entry
> >   /pid == $target/
> > diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> > index e7dbc3b2..6d3d79af 100644
> > --- a/test/demo/spec/specopen.d
> > +++ b/test/demo/spec/specopen.d
> > @@ -1,12 +1,12 @@
> > -#!/usr/sbin/dtrace -Fs
> > -
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2005, 2025, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > +#pragma D option flowindent
> > +
> >   syscall::openat:entry
> >   {
> >   	/*
> > diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
> > old mode 100644
> > new mode 100755
> > index b918e663..d7d6cc88
> > --- a/test/stress/fbtsafety/tst.vahole.d
> > +++ b/test/stress/fbtsafety/tst.vahole.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -Cs
> > +#!dtrace -Cs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
> > old mode 100755
> > new mode 100644
> > diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> > old mode 100644
> > new mode 100755
> > index 45c37efe..b54ba982
> > --- a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> > +++ b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> > old mode 100644
> > new mode 100755
> > index b51e1160..93ddbd2a
> > --- a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> > +++ b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> > old mode 100644
> > new mode 100755
> > index a4880cca..fe6fe34a
> > --- a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> > +++ b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
> > old mode 100644
> > new mode 100755
> > index 8f7b210f..23caa113
> > --- a/test/unittest/scripting/err.D_SYNTAX.concat.d
> > +++ b/test/unittest/scripting/err.D_SYNTAX.concat.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
> > old mode 100644
> > new mode 100755
> > index 34ae864c..baeb2901
> > --- a/test/unittest/scripting/err.D_SYNTAX.desc.d
> > +++ b/test/unittest/scripting/err.D_SYNTAX.desc.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
> > old mode 100644
> > new mode 100755
> > index d3338cfd..bec28942
> > --- a/test/unittest/scripting/err.D_SYNTAX.inval.d
> > +++ b/test/unittest/scripting/err.D_SYNTAX.inval.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
> > old mode 100644
> > new mode 100755
> > index 01044d6e..72d9dfc0
> > --- a/test/unittest/scripting/err.D_SYNTAX.pid.d
> > +++ b/test/unittest/scripting/err.D_SYNTAX.pid.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
> > old mode 100644
> > new mode 100755
> > index 905fefb6..af7e8ded
> > --- a/test/unittest/scripting/tst.arg0.d
> > +++ b/test/unittest/scripting/tst.arg0.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
> > old mode 100644
> > new mode 100755
> > index 9bbd8e49..527f3242
> > --- a/test/unittest/scripting/tst.assign.d
> > +++ b/test/unittest/scripting/tst.assign.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
> > old mode 100644
> > new mode 100755
> > index cd7b716a..57b75639
> > --- a/test/unittest/scripting/tst.basic.d
> > +++ b/test/unittest/scripting/tst.basic.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
> > old mode 100644
> > new mode 100755
> > index 8d82f2bd..99ec11bf
> > --- a/test/unittest/scripting/tst.pgid.d
> > +++ b/test/unittest/scripting/tst.pgid.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
> > old mode 100644
> > new mode 100755
> > index 2d0499d7..dc3e3182
> > --- a/test/unittest/scripting/tst.pid.d
> > +++ b/test/unittest/scripting/tst.pid.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/tst.quiet.d b/test/unittest/scripting/tst.quiet.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
> > old mode 100644
> > new mode 100755
> > index e4f1395c..48f45f57
> > --- a/test/unittest/scripting/tst.sid.d
> > +++ b/test/unittest/scripting/tst.sid.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
> > old mode 100644
> > new mode 100755
> > index 148e5c60..bcc4b445
> > --- a/test/unittest/scripting/tst.trace.d
> > +++ b/test/unittest/scripting/tst.trace.d
> > @@ -1,4 +1,4 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> > index 50bbf177..97c0cb6d 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   BEGIN
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> > index 1590807c..206641c0 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> > index 47e248d2..38a92e60 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace (1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   BEGIN
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> > index d01ab558..ab7c6ed9 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> > index 14cc1d5c..da6e17db 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   char a[2];
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> > index 89592786..f57aba47 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> > index 43a41440..704b3b27 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   string str;
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> > index 3bc21b18..da4038aa 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> > index 80a3204d..d0ccfead 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   BEGIN
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> > index 3c120a03..7c15314d 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> > index a8c1c4d4..7e98885b 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   BEGIN
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> > index 136f5cde..6e85370a 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> > index a0bca73d..2518cd04 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   BEGIN
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> > index 8cdc6ba1..98725509 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
