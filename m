Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E113425B1E0
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755534632; cv=fail; b=CvZtH8x9PqMj2nTHt7omgTuR/22pf2sHaWYdIRK3bY52UcR7pVfovGowXc0mJRE5SDPhL18UJshQ6qE0M6PqcDBYUTK+WKim1kTEM6RZRFNuEy6SgTLYqjfWdhqnbSSMwbwGWiBjXVDPmZ/YnoCEbZvZKLMMvK9gCyD9frzca6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755534632; c=relaxed/simple;
	bh=+DmM/etB+9ot6qxFc8M6mUEsLPUVC+FkQM7mwzNI47g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rb4yebPPZiKngEF1kfzpe+MBKgw4YcZPMWRNUleZVRMfCnYldJcQO29OTs15WX/tIr04KuWNYAEo7gvw8EL0TEn/TmI+6dvEC2lrwxU61oDNDXcjq4NWtocZxCohINFpn8gyNF/14H/RjmZuhZUpGSbHq7Nu5deVEXdGSPfnt/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RrsGvIHt; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h5U2pwi/ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RrsGvIHt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h5U2pwi/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IEtrrU026746
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 16:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eoibgKp90OR2yQQoisz6HL3RGq9MgcHdEP76vHGYKS8=; b=
	RrsGvIHt1icXVl5GHSjx/n1dfHo//AJuF9k11O2QySYHTzgTzqs4Re14XIC73Iup
	Qpcop7gUev4vUO29Kq2+TzA/hS0q8kCfKWvil6cmefqCyRPCnf3qiTHEzTJNTg7r
	YwJ0HkhuGpoHIUxLn6237/xtu064R2ut5UVM21TZD1nsUoPfQZ2WEbqOzSO5jyn6
	75ClGSOyu177n9U94P1k8f7cae0yRbUa2MmUeY2adx7cFLPJT8D6PJDWr13WQqx4
	0SVVf/qDQOlfQ6Gs0NgXAviRdjGXLju1+9x56aPe4x9TvXHOLU1SGSHcfX0LBQYI
	7OAkAof8dtZGRDap5t6drw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jjhwuft5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 16:30:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57IF16lW036849
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 16:30:28 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013032.outbound.protection.outlook.com [40.93.201.32])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48jge9qt55-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 16:30:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/YEJH7jHqGedrX6iYB5pk2M9Ggc0DabjA12PUrhCU1+6FoMxuyTNwIXqUrbTx8pxWdyd+gytbitALDY/kLF/lGSOSwlU/2EH7OmF6xah8d+p5u2+JVh2EM8c5dikc7Bp8TUh7EgWKbQabR1HCV/Tg5G/xI68MPUMtakUTuZM6ybOm6cOeaeeXGDd8mE2jvHwfcsFapAChEnjaSX7UZSz1+ztVcXtESD9WQiRisfXa+TYtONaevIk4RcrbWOof5Lg1smfhFhgypNbCWk50XguUFgAEHkPCLVVJWGK4ykFhw7bKwEdQvz2eM+dS88SbAucXZgsCmL2Ls2a/LBjHZlWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R205wjj88Z4zzQFx0XhytV8sOd/f82Ve87Tuj7H3rCU=;
 b=AkhqkNLk0lZoU6oG0p2JVix9cyBPsx+6dTuuEVo16g+rroy8NWzu/XNja4Og9tGSZGotIBij5zu4WS+3AcSRiVb9ooULgn4mRRBY4sxrbwQpfdCb8nSVh6mDX55L6zGwew2erqV6vtGefxWVXu44JCPDxHdJcmW9Mp/VRXGCuRxD1WWGt8AYd2bSC9XLPUrm2kIuHofSfF9EoyTFrLvwIWadJtRy3iaQTssU4IeeGJ4tCIbLaGlEhUjnBqjNbrrYnwPboYpDK/7xXpG5MhIFKuCX/eCqMO3LmR97H4rtZ2/jKAk39AQGRJa685dtOsPI0ObmVAvfE2uEWALGIVr3Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R205wjj88Z4zzQFx0XhytV8sOd/f82Ve87Tuj7H3rCU=;
 b=h5U2pwi/49nOQUgl5KLq1ukE5PcWkrmwjT68GRJgxBY4Z+2vqs06JIM99irpo+332iR16F3w3SvTvFS2kGzumj0Q4JfESZueNEE92WypyLUaQK7CCn4HOYUGsCAQ9boMLLMQNHD8URSC1Zg0q8mAzWbvWEFVt8xvm4ioGtfVGwc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH7PR10MB6311.namprd10.prod.outlook.com (2603:10b6:510:1b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 16:30:25 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Mon, 18 Aug 2025
 16:30:25 +0000
Date: Mon, 18 Aug 2025 12:30:22 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] No uprobes on ARM autiasp instructions
Message-ID: <aKNVHmWHJUdUa78z@oracle.com>
References: <20250610211042.20522-1-eugene.loh@oracle.com>
 <aJouQe8qUJSIPKD7@oracle.com>
 <c60dfe7f-9107-dc90-eed3-1a5afe6fe93a@oracle.com>
 <aJpq8xu03/1BZF4i@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJpq8xu03/1BZF4i@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH7PR10MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 98421c21-5cfc-4110-4c5a-08ddde74892c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?2l75v9IYYNIoxvww14ekJkkw7pGNvmkd2TnfeqXqQbvKVfca+CnERHZwee?=
 =?iso-8859-1?Q?LxIXNNNeFeAPJhxEW8Eima0ynLQL7f6aH5uFJJ0hL75iZZNf2Rh3NAHMiO?=
 =?iso-8859-1?Q?K0/4ZLYisKpQjmhuA72V8T3TJyNLLylYpncMHip3v0xVBZ/UhxI2Lxtjxx?=
 =?iso-8859-1?Q?SeaXB+nX+K1pf3svM/3YM/B2ShfxsvudAH6T6hfLlhpa8uWyxFp5L+ZnwM?=
 =?iso-8859-1?Q?1d0xkRz66MhD8CvJ32EbbjlMicIL4yF170I45KmRrJbHQrP0yNWwsLDFRv?=
 =?iso-8859-1?Q?Rax3gPUcGsXCe38oHfhpP5fzlHWvLbKFjU0FCCCXNpKoEtMJ6caYv91Z/W?=
 =?iso-8859-1?Q?eVCPkn0JMjQ1fGcPsCB8Z/qm7MXdJa6KGBOUMAlz7Nlq+NZsR9/K8MlhDc?=
 =?iso-8859-1?Q?d+FfEQlxKEla4aepIuWXzvCQ0DcPSeC3Qb0fSo/2Rt54DMVx73SktoTCjl?=
 =?iso-8859-1?Q?D0Yk2Lb6sx8Icxcapv5JEPBjc7hcyNwY4LfgQilQgmIyC/pm0xo4vEtnAP?=
 =?iso-8859-1?Q?jppYd8jIaI7iFjO9JCfBIvKW1VP7C8bMWQio8G2I8unVBB55OuZogyO5mA?=
 =?iso-8859-1?Q?Hd0ALtNV4eDK+Jyrb58rSkVHj1WREDQh97iz7n0GqSKqhOeglDsBLHwKDt?=
 =?iso-8859-1?Q?x/TA38cjE/4gLOD2K9Byb8sathRN7Q0CVNVuTcW0qVAoozaxate39hf0rd?=
 =?iso-8859-1?Q?pFGERjav8VMfS5pt2Tjay00mFewfcudWaOW4LBXFfSH64vH+Ws4/Gdiwlu?=
 =?iso-8859-1?Q?bVgsB5qU07q85E3wRO43NWmZEomynPeApSwp9dIavFP/MU1WQom9w6CQfS?=
 =?iso-8859-1?Q?ws96yRa3WW56cYKQNnqZoS3cswVwUZuk/TwnqseeLsAAj/cQqb7DV9LlNl?=
 =?iso-8859-1?Q?WMt+emyCBy4TIbLkQsANUnBQKn1Mkiem6LhJPtE2yKUE2P/BXkskD0KOj3?=
 =?iso-8859-1?Q?LL5hvQSokWcbATZGSTESbpz0nYNtaQVQguaEJJR23yJC7ptAaIsiQzTk+P?=
 =?iso-8859-1?Q?WBaKRWq1rmgfODXWPgtkda6EOYvkrfYKAFFQxzieVBx36zxennsPpviOj9?=
 =?iso-8859-1?Q?GI8vtq+J4RYZbB0Cem9Wqa+P+HtKOhmWVodXjKlU3POMrM9RvbllT7TPiS?=
 =?iso-8859-1?Q?ypMERvvXxTQ6ICHFsfypR4sXgT7u63RW+fGZx1poexcw1JpnnZLsPKWHF9?=
 =?iso-8859-1?Q?9k6K+rCAwTN9qkvfS0NNDMEqkurBQcq3XyVyBIzK4awFzd8CECDX6RU3nL?=
 =?iso-8859-1?Q?GQNNFKVafn3q4kJxWT0pYmWwT6MtexpZqhOumjeCRCZQpxXiYmnXrP3CvT?=
 =?iso-8859-1?Q?EqfBo/UH59x+IReVdHgUUEcEtuse4PoO7rd7zDr53ckYSQRqxM2IGfUIIk?=
 =?iso-8859-1?Q?24gOk++6A8i31ykOrQai68ggaklaxcK0YVWpS0IJY6IZeTwFMPGR+m6w+6?=
 =?iso-8859-1?Q?Xf1Xjf/yvQrIyZUwPx6Ed9pGwmTS45D6/XqsLLXyyr6pYbd2SrpT0gmyhS?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?sYTHD5FxGXwdqfu3kOF6YCnyRXqmU9D5WLtKHJKD9p8yiB/GpmfFeEfL0X?=
 =?iso-8859-1?Q?Ltoyy3QNgVBWfcZw+3qTejxPCH3jA2EDwQKasEOcpIndBLknlldUJg1uqU?=
 =?iso-8859-1?Q?7tS41BsE7oe2qWjL5kSe1mTbo+kbjiZqWRO7v/CDvcD2axFcr6CzCTwFHU?=
 =?iso-8859-1?Q?bdxE8lG136BEpJOrj1pxxhBcEwPa5Ff8yJ9liVwSWzDtfPJ4bPAo/impVz?=
 =?iso-8859-1?Q?kbVvp6YmQm9hzbo5AJFXDyqKQrS/m/SQ+URcCARtm5IVuDQE31+VY4iBjk?=
 =?iso-8859-1?Q?W1Xl3kHOPhbU/ijx4iRLNXongESiEdvAaJmgdASa/dW0AE6bINyOzfMCh5?=
 =?iso-8859-1?Q?DU2ba2FMWXEffW/KGctLsYlM8B2/ep34VKFgNYP9hmplqoFnyaNz/U16Z4?=
 =?iso-8859-1?Q?MA9NgUqZbx5V/Wv2KsG1KEw2qthwW+pSlSFEQeZ2OpVYrf+GoWzl3lnXGs?=
 =?iso-8859-1?Q?GvS+iKNuYJHYo14rRbYOorYTxEBCIyjP9B6j4frEcYuwTfWATdCsgkGx1y?=
 =?iso-8859-1?Q?e2PMr2Sl4X6VGR3qzHkKwt8U4Ol3IsmFiEVcbyec0JXClld5ctmU04isvm?=
 =?iso-8859-1?Q?SmysEeJn735oPYOa5muucyyu5vUIpy4ajbpZJRWJHk26D9TZNtYZ/iOB81?=
 =?iso-8859-1?Q?POPAaawbnb0sSjZOxrIzwXriJDfQyzedO8EUO+LyrxaU192KQjIBdje76O?=
 =?iso-8859-1?Q?FtDQtzP8W2fD60VPnuEXSKy+QW9Md4GE7wUP9TNVtnMWS4S2n7lU//KJE0?=
 =?iso-8859-1?Q?OZgcqNdrtzzqRgk5H82bZioDPdxohpSHzWRzK3nIB9+nkHyxa9O3CGGW+C?=
 =?iso-8859-1?Q?ghQ/81O8BUeklUKBJjpcaK/Ksen0JTOcMUoDbFU7MuWU8QYuwbm6pyOrU0?=
 =?iso-8859-1?Q?TFX+rPCY8PcQ08AcpGbrLJeTJXmazfJrdq1Tm3SaLqLzdeIxQoN3aPiW+E?=
 =?iso-8859-1?Q?gAnZnucsXz0A1yojmtfgdtnut5/ib7U/s+KKXp/fYUGBQEMuE2Q6fk3iYJ?=
 =?iso-8859-1?Q?a9e5StF1NkWfFrjyhSR3qg2Fbvar8B5uS1XucH+dSSXaSPF4KYJe2f0+kA?=
 =?iso-8859-1?Q?lQwd7kBOavLod4OH4PfFKnpGRDwO/eK+UDR2FhJK3rdDnYNZQW5ZRwoLNR?=
 =?iso-8859-1?Q?zpQtzEIfXdAVD20ogNZFCP2rkSmLC8hDT+EQm13LBos6TYstBycZTm9Xth?=
 =?iso-8859-1?Q?K0BBJe/w9e7NrUMk0yNk7sdQz1f8fOZ+iFuOiUOc2DuGXU4CPl4ANc2OJ9?=
 =?iso-8859-1?Q?hk1sfSK/saPicLGYNFZuCNKYMGVlb+uRZK/2Xcb0oDHI7EW2CefPEnE2kr?=
 =?iso-8859-1?Q?CbFc4UXnwUiD9vd789wKv921vVGHf3N+qcnIpTHbITMDTPzvwT7gPxmrK1?=
 =?iso-8859-1?Q?C4C+j4LeHvvRIbBgth2ICjfUMqbnl9K1JM+ABtWOtmRdTOBoSuU2StrLqW?=
 =?iso-8859-1?Q?mnPRQdqkDh1Ph5/1reHJusM5D2LaG5BkfLu6dkjjTBwfpQBg1YCj8HZijN?=
 =?iso-8859-1?Q?mRjTzogvylccYuBNgzPVaz/6L3J8f8S1ppfo7iRKzbXwbprULM9d6Zedn4?=
 =?iso-8859-1?Q?sw/88W94Xx6eL8AS0gqpi8R4TU/aUjwxIbVc6xfGvZURaP7N2VWyJu4e0c?=
 =?iso-8859-1?Q?N9OAaKZy9TMiB4WG+ZkdrvAGa+neOPDGpP0n6dtoQprItHNGJP7Mcd8Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aMWM1UDOOTOBiss+OlkvA7raOpnTcqzZyTbRdOIvwNco/NVvhsNoQhaQAigVgFHjj1OIIscA4qfCDLvmEGFTROLk5TTMYg7OlbZN+WHDMJOF89X1yvN/LrR6lkNTwd7+zDb6g2KdwCwistg7JEdPH6YTtOpUK9LYWyhhikG1teHm1g23LbVgx9Zg/kVO70zPJcnhGDZwpO+KUs8HiQawXHF97ZwWvm6lOl+aq/MHI3d5ETLsIenkrkTs81UJQxIeAWGEZ0GjxKXpc0vej+/hvzjdlWZsyssxDU6oT9eqjVH7CAVnc3YzbtNjXF/cHVYgRPRrpogcW6KOyIo2Abps3dP7uJf5Rwc3Yf78JXijy4tH79g7UH9XJiev6w+tQXKlmT9zM6B0Pj7LzWO9Yj1sPTi1DHjyDteLsQZdxwJ4idTIXQy3MFnyWAW24ngIMVPfr8vwss6eMn1q6OIPDKriatsx5Ex+hePWCY/ab733EdjRy5g4YmzZYY9mgjxYGURE9EkFxGm5F4ufTYNOgtP/JZXU00bXtl+ZpeEt2vLRCHlCT41BouB/0bBgJfIk+xr96e2gmPvubgFAUFYyTL2w/3ylyb743UEqQl+0IjXAz30=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98421c21-5cfc-4110-4c5a-08ddde74892c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:30:25.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvL97gSgyJYW1pwuImA/i+YfXR9ypEBTmtR5NtlJb8/+btHdSzKiRSTih+Bh+eCXCQbkCVtJftNHIozyDIjJGaKVomKnA1UhQ6yEDY7N5jE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6311
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508180154
X-Proofpoint-GUID: C9Ei3wAyc2XEKdMrR0DkJHE1tKH0B9Vx
X-Proofpoint-ORIG-GUID: C9Ei3wAyc2XEKdMrR0DkJHE1tKH0B9Vx
X-Authority-Analysis: v=2.4 cv=G4wcE8k5 c=1 sm=1 tr=0 ts=68a35525 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=t3O1JwCZcpqTYZ5jnqcA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE1NCBTYWx0ZWRfXy7CNL75NNOG5
 aSc5BqZUJPrq6Cxm1ySDerqEDCAB4Vh0g3Vy8n9QqxF0QChrVBD8oJ1uKQMFEmIA6XEg6lErb8i
 FozRU8zhp+9gOL41HFML+KwevV+m3Har1N5/W7qHJXMhHKr/C2u6X8eMwjrRiJ+DTT9mlIOCbyb
 nu1VzcNFN/GW0anPQfZ/JeJD6A8G6SKZdibULQA2XxDgbekSUuQu/bUAR8KYQQfiltmGDS9r4f+
 ej7yvk9g4UEfufgVaIiAVhKUE2ELTcvSiE3QFqGCjshn07RrsYhksoWSRDO6MwzxFsyOlVAFND9
 HwRWFtE6tE+y4JAIvyEr0MVO/Tp6wWpJEafcVqNjrOCMAVpTNPoSRWVgMzb9z/u8HioOmdfWQCk
 Woc30nhZdgIX4spPI9x4bofSNaWinRdFk40oMja/Bjk0QgStlpD4/jNcvVVu+3rr1zwSm/cm

Per discussion we are going to address this by somehow marking these cases
of probe specifications (wildcard instructions) to not consider a failure
to attach the probe as an error.  Specifically probing a given instruction
and failing to attach should always remain an error.

On Mon, Aug 11, 2025 at 06:13:07PM -0400, Kris Van Hees wrote:
> On Mon, Aug 11, 2025 at 04:52:43PM -0400, Eugene Loh wrote:
> > On 8/11/25 13:54, Kris Van Hees wrote:
> > 
> > > On Tue, Jun 10, 2025 at 05:10:42PM -0400, eugene.loh@oracle.com wrote:
> > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > 
> > > > New compilers emit autiasp instructions much more liberally.
> > > > A test like test/unittest/pid/tst.entry_off0.sh, which tries
> > > > to put a probe on each instruction, may fail.
> > > > 
> > > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > > ---
> > > >   libdtrace/dt_pid.c | 23 +++++++++++++++++------
> > > >   1 file changed, 17 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> > > > index e2d4e540d..833e9b647 100644
> > > > --- a/libdtrace/dt_pid.c
> > > > +++ b/libdtrace/dt_pid.c
> > > > @@ -279,12 +279,17 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
> > > >   		nmatches++;
> > > >   	} else if (glob) {
> > > > -#if defined(__amd64)
> > > >   		/*
> > > > -		 * We need to step through the instructions to find their
> > > > -		 * offsets.  This is difficult on x86, which has variable
> > > > -		 * instruction lengths.  We invoke the disassembler in
> > > > -		 * libopcodes.
> > > > +		 * We need the instructions for two reasons:
> > > > +		 * = On x86, instructions have varying lengths.  So,
> > > > +		 *   to step through the instructions, we need to
> > > > +		 *   disassemble them to know what they are.
> > > > +		 *   We invoke the disassembler in libopcodes.
> > > > +		 *   (On ARM, we step through 4 bytes at a time.)
> > > > +		 * = On both x86 and arm, we want to skip certain
> > > > +		 *   instructions.  So, again, we need to know what they are.
> > > > +		 */
> > > > +		/*
> > > >   		 *
> > > >   		 * We look for the Elf pointer.  It is already stored in
> > > >   		 * file_elf in file_info_t, but getting it back over here
> > > > @@ -298,7 +303,6 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
> > > >   		GElf_Shdr shdr;
> > > >   		Elf_Data *data;
> > > >   		size_t shstrndx, off;
> > > > -		disassembler_ftype disasm;
> > > >   		/* Set things up. */
> > > >   		fd = open(pp->dpp_fname, O_RDONLY);
> > > > @@ -344,12 +348,14 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
> > > >   		/* Get the instructions. */
> > > >   		data = elf_getdata(scn, NULL);
> > > > +#if defined(__amd64)
> > > >   		/*
> > > >   		 * "Disassemble" instructions just to get the offsets.
> > > >   		 *
> > > >   		 * Unfortunately, libopcodes's disassembler() has a different
> > > >   		 * interface in binutils versions before 2.29.
> > > >   		 */
> > > > +		disassembler_ftype disasm;
> > > >   #if defined(HAVE_DIS1) == defined(HAVE_DIS4)
> > > >   #error expect disassembler() to have 1 or else 4 arguments
> > > >   #endif
> > > > @@ -390,6 +396,11 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
> > > >   			/* Newer kernels do not allow uprobes on "hlt" instructions. */
> > > >   			if ((unsigned int)disasm_info.buffer[off] == 0xf4)
> > > >   				continue;
> > > > +#else
> > > > +			/* On ARM, we cannot place uprobes on "autiasp" instructions. */
> > > > +			if (*((unsigned int *)(data->d_buf + (sym.st_value + off - shdr.sh_addr)))
> > > > +			    == 0xd50323bf)
> > > Are there symbolic names we can use here?  From an include file concerning
> > > opcodes or (worst case) define one ourselves.  From the comment, I can assume
> > > that the 32-bit hex value you give must be that instruction.  But is it an
> > > actual 4-byte instruction without any values taht can be set for different
> > > uses, etc?  Perhaps a define and a comment explaining the value might be
> > > useful here.
> > > 
> > > And perhaps do the same for the 'hlt' x86 instruction mentioned above it?
> > 
> > Quite frankly, I'm not familiar with these instructions, and the situation
> > is getting worse.  There is another x86 instruction prefix that causes a
> > problem and needs to be added -- some "multi-byte nop 0x66 0x66" thing.
> > 
> > I'm tempted to go another route.  Instead of building a list of hlt,
> > autiasp, etc., just exclude the ones that don't work.  That is, if I ask for
> > pid$pid:$mod:$fun:*, silently ignore the offsets that don't work.
> > 
> > If I remember correctly, a challenge with this approach is that you don't
> > know until later that a particular offset will be a problem. Each offset
> > would entail an extra runtime check.  That seems unfortunate (and
> > unnecessary, if one could know in advance which offsets are okay), but maybe
> > it's not such a big deal if you have a lot of probes anyhow.
> > 
> > Anyhow, I don't know these instruction sets.  It might be nice to have a
> > solution that does not require specific knowledge of instruction sets (and
> > other info).
> 
> Unfortunately, the only source for this information is currently found here
> (for arm64):
> 	arch/arm64/kernel/probes/decode-insn.c function arm_probe_decode_insn
> 
> (for x86_64):
> 	arch/x86/kernel/uprobes.c function arch_uprobe_analyze_insn
> 
> So yes, um, good luck.  Interestingly, the arm64 case seems to be easier to
> handle than the x86_64 case, yet we do not seem to run into issues on the
> x86_64 side as much, probably because the unsupported cases are sufficiently
> rare in code.
> 
> Trial and error ahead of time is going to be expensive.  But we could see about
> adding some flag to a probe program that marks it as "ignore any failures for
> enabling any of the matching probes".  Also, it would be worth looking at
> whether there is a form of multiprobe support for uprobes in BPF so that we
> can get away with a single program being attached to all the probes (saves
> memory).  But that again would need to be able to ignore attaching to any
> instructions that cannot be supported.  Not sure if you can do that.
> 
> > > > +				continue;
> > > >   #endif
> > > >   			snprintf(offstr, sizeof(offstr), "%lx", off);
> > > > -- 
> > > > 2.43.5
> > > > 
