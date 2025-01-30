Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605BC8831
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 04:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212419; cv=fail; b=e7H8zzWbP7ONueS2KMwii3hvGe4+c6TwqrASYfTB3LSCkM7Tro6B6/O2rC9+12QmGgC8WXNJjEw9K9bY+BiIjWRgs7SCcVvtzkyGgITsQQkeFyLUE5IqfXkp4qEqE8FzTJorztO0MDLdqxBcnABHz4SpKDN8ubquJrwv00gopKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212419; c=relaxed/simple;
	bh=EhIeoG2k4g+ECJNTcJymo/J1M9+s/OBswuHQwSJurqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JKoIq/Sz1ybddZJDAc0PCP2ona7eta2tISlhxD5B54bWSimWW5FoyL5sdeFWOLbbGq0tkSNtnQGyZQPsI7Eqkdi03MBZZSezol1yqqj/yOtqq843b5ak4wroOcJ9Rl4MAJ5tpYJ0vk1hNY7OFLuXVwhnfuUz0gvLqskpaKtWI8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D2ehnNgV; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gjCwnPeq reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D2ehnNgV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gjCwnPeq"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U4VhWe001441
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 04:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=NjrTEXoBkHHW3dxTsj/ZV6usNzu547ZvHv/I+W5RmXk=; b=
	D2ehnNgV6E6IVnoWkJnIc1iwpiy1YhI6V4Zde9+02LnJy8kEOtjCJMZRa15l4HUq
	wfuHLOPr1oKmuNd9p9Ks8/+izbkjW9fKOlCFp/r6gVvtd7xB8urbtTubnQIJ5fPS
	Cc6VR8dC9Q3IzOBQsQ5n2CU9yvK2ZXA+YN3T/E7g2Lb0OlRL9RHd1mD7cGBz6hLH
	QJCcDwD7YLlrtX7XoFaZkB0IjkOXqYdV4G23AX2X96Wpzj4tnnie3KLhODBTzI5U
	x7M02eqSIwpND+vspg3+f6rmYXPC0UCeHrsAbfkniXnU/uF070hdMOYpWiQ3B9wq
	xB15edCf4xCLAEvzz75uXg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44g2fs00hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 04:46:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50U3RU20035947
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 04:46:55 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdgpqsv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 04:46:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2NSuHo811Ntz3Z8QoOAXVOqAvJcBZjrpF/UIoMSSYyvXYkSkfrPZvEY5U3+Qup2ayyFsgWyZ5Cu0iCSX/Kqa5j7qkHWG8W+YyrgyMZbM92GrO2qfy5/oCTLLQZgJHN6ARPZwTGjRKu7SHmNAA2WUQM8xnKPaJotNimPBmXWNI+CvP7i2ghksrhSnYaFQlDimY0Xtr5+8pjY0BaCXP4hpRI1WEM3Pkga+lFe7zg7RXTNzEfcEQD67pXy0tYax/fkvO1ElvZuLHlUyapodF0j87t+0hXE5tB7LZ9Pf9knoz/wusgWRvwP3BvP35LeCwWQCGdXBsfXihiOK1Ks8Lywlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/bwjW3scTdT9WXJbnixSLs3ogW47ucdCvxS/poxMYQ=;
 b=FIiJ3bxj4yl16BJQYMLxddtHObhS9pAN/2+E+97olP2G1s3p8uAGoKrjMtUlfJVt8tB4jv8mkIaF+/y01qbVBSEoQTsbAt0ZevJ+mx7uP4lTRD+dIoDS7dx4tqa2qUWO46aUR+uDR4UnIze/Tb7AjaH5iCHVNWhKdEORZMvInSPBixW2G+MkpRqVYu9hq25a/7VWPgHbh7BT3tVIQQvtdtqyGB8jpFi0qjGEYa7hZzUPXnPHbAA+y+Ps1uk+V4g+W++w7Dugo+l1KUCeXApX+e6wRMDXck9hViko71EOY+QO5Ev8HJHUkAH7aly5wagSwuw6ASpDo5KyNB0W/l/F4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/bwjW3scTdT9WXJbnixSLs3ogW47ucdCvxS/poxMYQ=;
 b=gjCwnPeqSksXMr/O5E5/PxgHv4C6jsV/4gWwa44NEpEkxOQiGm9RgOEiUEsdfJECHh3YYN31gQ2q+Bz/gTKQkiS0vI4MUrYTUo2bryaYkwe6ENapN6pxVwvr6hK+TGufD25MJ1N8w2G2W7uH+XGcFteHbfkEDWUJhxlKvczYhjU=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by LV3PR10MB8036.namprd10.prod.outlook.com (2603:10b6:408:28c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 04:46:52 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 04:46:52 +0000
Date: Wed, 29 Jan 2025 23:46:49 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 5/6] procfs: add 'execargs' global variable as inline
Message-ID: <Z5sEOU+TrZZVnSBy@oracle.com>
References: <PH8PR10MB63378175F68DB1DD5D55463FC2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <9164adb5-a6b1-a7ff-530c-6aa30fa57be3@oracle.com>
 <Z5mY0VUgun8jSNq/@oracle.com>
 <Z5nOoPF05zuDGWr2@oracle.com>
 <58ef1fad-97fb-c907-cc0b-fd29de5a58dc@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58ef1fad-97fb-c907-cc0b-fd29de5a58dc@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|LV3PR10MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 9225dbde-2fe3-4434-bd5d-08dd40e91d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?k9E6NByj853dLPzIWEATI6AmlYdjusxMDyYRgOtb2bRMCFcooINeDLIJfo?=
 =?iso-8859-1?Q?eon3iZ4MYW5X6ztOq3Ozz7KKBI/7V2Qn/a4sdk3F0jjdHjLfiXRI1PH5K4?=
 =?iso-8859-1?Q?DxvHX5LGokz0RV8BOiQjkBdkeAa2g9GLRAIkjSkrJtkpuKXcP+3zsHV8ht?=
 =?iso-8859-1?Q?Et1d1SxmqdGoAX8mLNtGd9Vb/FIRsHSEwJzsx6Hvcta1qpvds5UWJn+wDl?=
 =?iso-8859-1?Q?XS0AQyNZOM+SyvtInJ9dgnUMvH9GztH+8BmoGJY8Eh71NndfMoN2zZRItP?=
 =?iso-8859-1?Q?5MlICCNjkzg/7jXPyYMUOhPx26bSS50Oiw+0ASOtXTJCQj/mFvU0Ewcsf4?=
 =?iso-8859-1?Q?hqVrLwc9q3L8NesJkvn0psLo3611AvwgGcUeojkn1YjFBv4oeIVZk9CgWf?=
 =?iso-8859-1?Q?wNm9BuyPE928AbVGIWd+VgezWu5kvTx/ophChwYxRrivKP7Bssu91Ynf5E?=
 =?iso-8859-1?Q?xwWmQZI7nFG0Bb4EMM36eMUdAx+pLmycTwuMKQtXIZJ5G2RVQtYsERYFM9?=
 =?iso-8859-1?Q?PbIYEZurYg1UfdWKoxcIvqQXQyGVhSQYKS76bfITTuVl1GadDeUFY5FU9/?=
 =?iso-8859-1?Q?znFcszFn459B25AqyvqKrTL3oPSWDVmUlouLOjhTKIHpgTMn8g5s/gN7FP?=
 =?iso-8859-1?Q?jtPiUvkpK3RVbL/odazhRr8r1vaBKlvnlIWlqpzQlD1N/QlvS5nBYV/znp?=
 =?iso-8859-1?Q?ZOACqhlnDCgxdtUYYJe3iwRs9qKepvmFXp3cyT3yftF0Hpfge8hXZny8WT?=
 =?iso-8859-1?Q?ZD9MvaFeqYUFEsAo5pERaqnABupG6DFBQRVxbV54fuGjeSNkFQY6WS5dkG?=
 =?iso-8859-1?Q?77lT3fBO+xyQ8pbdRt6fCcmeElyxVeGWEf6jDH8g/0dnic9HeWcIDGSBbI?=
 =?iso-8859-1?Q?rlnP1Wjmc2JXoxFREJor6txFtalUWf8CdhaJ1dv5nsCoFSmPPQifXFDyeK?=
 =?iso-8859-1?Q?GmPg+n3lq4mZzOCfdcfcdZJoW0BbatwnvydlDap/J9PiUiJFy8XKj0iAOe?=
 =?iso-8859-1?Q?iQLwX3QmdE8vxHhm6pBHd6z9wIfH7qjZdryPftR0v8w3qxh01zS970nhgF?=
 =?iso-8859-1?Q?K5YhIRC7zb0vMINCfxObcfvYqd9FY5+c8RI9fNQnMkqHxRk/VIA+/a3Ca8?=
 =?iso-8859-1?Q?iodpiIGFGI0eTIWcw3DpswXgvzrnbaRqdtNBp9102WZz4eR4Jgyh/mTuC9?=
 =?iso-8859-1?Q?KSIZ9Xy56MRPcVWNibkHGyk1oh+8W/JPfWEHNl8/W7PDb4knMedebVMzGH?=
 =?iso-8859-1?Q?gSCPse924VrYy2PHJbhMFmnJJZ6owPmsZFpNVASfPvr+naxFATyQ45C1QY?=
 =?iso-8859-1?Q?Zff3HnTkWUpdquBGvJASrKaB4OLXV7uDYEd37ZIhAFLfdcGdvu+rj8lwha?=
 =?iso-8859-1?Q?yXXXdgVD36Ofpe6Hsa9qU7xkyLBBCKe8SpJdDXmf5QrMWR38D8TpO/lP9p?=
 =?iso-8859-1?Q?R54brvaw0YH9SHSU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?SD2Hij/X7Xm8xjQ4YyuJiYEJSxIG7mtWX6f6M0f+qPBQzjoihn1kdfcnvP?=
 =?iso-8859-1?Q?lAabCCanNmp+xSbCqzswbtkNaVEwatNxIMC0F5yDeBIcX7G3OBLEzw/xPI?=
 =?iso-8859-1?Q?zlNkh+9qoV6fHPYYr4Fi8zYOZmOVBoa/PBzWOh1+gpiDlYQRyUlDbhQN6O?=
 =?iso-8859-1?Q?8KetKLx7XQ7gdwjGegmykcef+SN4VW59WggTGOetSomA7Kdz+WZUdRgl2L?=
 =?iso-8859-1?Q?6wEtL0YuTutihJdBdJm5rnFeMdagkwxFzXWfQ1MA1ckJldOEKe0Axipdn+?=
 =?iso-8859-1?Q?Z0pRKEuzcEn+me1quD7jDikzFbFx6fUC9AlsY7XDElL2KXgYw+B1tMuJug?=
 =?iso-8859-1?Q?6LjGZMtZAcZU0V58ZlD0j3TXXMHm8J2Es0Yy1kJf9V22bTnhzaN0ePPI9W?=
 =?iso-8859-1?Q?yJiYi3puB0CCq3zQ74DR/JkGfyzEWwwZ+L7eCsyMQ060NNuPsxmHavYauT?=
 =?iso-8859-1?Q?L/S1IPovBt+2uh4jLcyFYrOijRRVglr1O5fqTkaqnHI4XNKA1yqzHCpDNj?=
 =?iso-8859-1?Q?ytIoXkaKR5EHh22Avu8xy/dfyMvJXg/++YIo2hIRIR6VtbMxwz4jhFY92k?=
 =?iso-8859-1?Q?goNTk5vXKAq4YxkAXIGCoKqQiIiZxWZn56KkgcleEl/gRNCC9uCl2me2hf?=
 =?iso-8859-1?Q?yqnJTAgvbofHe7LtNy1X4oHzoGpwk+WsYEaI9WzqpPS4ppiWcxGGaFMvlq?=
 =?iso-8859-1?Q?rgNwugssV/M4R+QXQRptAa0h03S0fL8Of3JY9XMYJmyqUrmLq1iw58d3Mb?=
 =?iso-8859-1?Q?ZmPA+J6QxPUTtfEkJTwywnKLIH1fpfM8ksJ4tWxc4B7Iv9dsTu5lXX3+Wl?=
 =?iso-8859-1?Q?e4qioTkRHbfQm9G8bGb+YB6lvQOkL1y9rdKrTLDHCkj58GMWV7Cb1859+z?=
 =?iso-8859-1?Q?LlIq0qThVW1d23T/dtwlizPKYvf1o9MRl2cNycaHtTVwmRxoV7rtC6oxAt?=
 =?iso-8859-1?Q?ruO/yqRtcs6F49sx7XjYD3ybElsDH08FDlzsPtJsAWKSXoaMUP9Ox/3bqD?=
 =?iso-8859-1?Q?AnGNRaWg+izBT/zIP/Pma7nbPpL51aew3k3tLIKGlj4B07jQbLObw/Z7Jp?=
 =?iso-8859-1?Q?C9vNHlYsJdICo14S5k9a3m79tOGDwsosI76REImI+8Ylf7g/MqMD2hk7Pe?=
 =?iso-8859-1?Q?DdRY5U5AfFyYLYWNIN/9N5S9ehUilqQypPe+bXBb0bzc7f/Yix5+45uuzo?=
 =?iso-8859-1?Q?BNOswr5p1WbrNi2Tw4s9XAtGRS/tkXZX1VJNWG0zb31lS2heWmPpfbT7ax?=
 =?iso-8859-1?Q?OBrfCzHr0f3+RNNArhds3vylkk+S0tqMyDWYdnLjKKdJuvobGZB3qM66pu?=
 =?iso-8859-1?Q?BOW3CCWNqIz3ducZ5uPKUNawfqhm7jTJok7UOL/35ygTG/zTtaxDEBWags?=
 =?iso-8859-1?Q?Cj0hwLzn7+LzDIw5FMCb/77D7D8dACldNMy3LirTKX1wlk1YvbkIZMYszL?=
 =?iso-8859-1?Q?oMWaUsTEvUGwzx/pDN3EjfzH6fWfFLsV+vLbcT/Frhox82P6Yvxnh+CUG3?=
 =?iso-8859-1?Q?VCLvzXZB/3WPAvjfgGtNiH0kFK5V9cD1x73el7UX01IvIPDJtYUBlp0dpG?=
 =?iso-8859-1?Q?RveIb/Rg2fqS/9rJ3JQcyirrS5Jyk+uTDbEWr72YX77OTaxdt6S1KYMNnE?=
 =?iso-8859-1?Q?ZFd8iS1qX1UeN/P44aQBwMFaMUXd0xVP9WRgGo7EhWEbIPckTtu8nsfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q6HLd8v6GU6r0+GcY5LXM7FoRBvYTBJLTiWaBMTrzzj4aE/C/n26iiNCTED9pgwfzV5sJUsech+whSr2bz9i5ESuoFNwM+0l/OUMH3eGFQ32J1IvUu2aJFl3RTtVxovGjNPwRuU533QyQvn7z8rjIgHlytbaX+/YYsY8MH7NH159f6qT6wP65k48ideCx55Cy82lsslGqgyvGu00grYGAKSE/nyLwazGzR9rhBicYajabyqenTJe/PG1SE/2IGU9E/DdQZtjBVl5Kfl1nZnnkOLpevghZsiZeGJr8u+u243CgP+NxPgVgydPof9ogad19en8l5XzW0FHSJ+QyP0QzeUr3Zj3wlteYjv3scaKPfrCwqBTF0RraX18/Y3tQQ9knvZJLeQ3RuNasV5jtgeoPkdSmb4xJ6j/zPtxspjjMIhzSIBmZtG7RnvLx1ExV8p9sTjtCJ7tEVkBx93CiP7FhKnMq9z+/QEs375TsbUyP95wEcSGCZPtbeVbb+WQYSBBErNaGUlBdMeVc2peZzHKsmHQqDW41pF9fe5xUZ6XCPK2Xlti2zrVNQymhQWixnt6OyOmlGbNmKyJo0eLtZwK7hdFNh6WZXmzlWGJ65BJ7i4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9225dbde-2fe3-4434-bd5d-08dd40e91d76
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 04:46:52.3598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVGr8Ymz1CbHiQbPKaEpfIz7aupHI6eYWdxyQyaJ1ibuC3xVKg+vTo3A3whdCy2vWmmW8Lm4f4f/JXpNpneFwdfc/1U3KtyIs6DMIyGoKXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8036
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=881
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300034
X-Proofpoint-GUID: JvIKLPec6hkVm65cvcT1RQNElBJ8iJ7P
X-Proofpoint-ORIG-GUID: JvIKLPec6hkVm65cvcT1RQNElBJ8iJ7P

On Wed, Jan 29, 2025 at 10:59:22PM -0500, Eugene Loh wrote:
> Is d_execargs() supposed to be user callable?  Is it supposed to be a
> documented feature?  Should it be tested?  What should happen if it is used
> in a user's D script?

I assume you mean this as feedback for the patch that introduces d_execargs
rather than this withdrawn patch?

Any function that is defined in D (as d_execargs needs to be) can be called by
users.

Whether it is documented is a matter to discuss with the documentation team,
but it certainly can be documented.  As long as it is understood that this is
a function that exists to support a translator and that its implementation is
done in function of that.  So e.g. we are not guaranteeing implementation
details beyond that.

It is tested.

If it is used in a user's D script, it will work as expected since it is a
regular D function, as one would expect.  I am not sure what you mean with
your question beyond that.

> On 1/29/25 01:45, Kris Van Hees wrote:
> > Actually, I am withdrawing this patch.  I forgot that we have curpsinfo as a
> > builtin, so execargs can be obtained as curpsinfo->pr_psargs, so there is no
> > need for a shorthand.
> > 
> > On Tue, Jan 28, 2025 at 09:56:17PM -0500, Kris Van Hees wrote:
> > > On Tue, Jan 28, 2025 at 07:53:51PM -0500, Eugene Loh wrote:
> > > > I'd like a little more context here.
> > > > 
> > > > Features:  There is a new execargs global variable.  I take it this is new
> > > > to D or an extension to the D language?  Would it make sense to call this a
> > > > built-in variable?  Are we also exposing a new function d_execargs()?
> > > > Shouldn't there be tests for using execargs or d_execargs() in scripts?  I
> > > > cannot tell if we are adding new user features (which should be tested) or
> > > > not.
> > > Yes, execargs is essentially a new built-in variable.  It is defined as an
> > > inline, simply doing d_execargs(curthread), so it is a short-hand to get to
> > > the pr_psargs info for the current task.
> > > 
> > > So it depends 100% on the d_execargs() implementation, which is a function
> > > that I added in order to implement the psinfo->pr_psargs translator
> > > functionality.
> > > 
> > > > Testing:  I see that the following patch (6/6) lifts some XFAILs on some
> > > > pr_psargs tests.  Should tst.psinfo.d be added to them? And should the
> > > > removal of XFAIL for test/unittest/builtinvar/tst.psinfo-bug21974606.d be
> > > > moved from that patch to this one?  And should there be correctness checks
> > > > for this output:  not simply "does this script not blow up?" but actually
> > > > "does this script produce correct or even just sensible output?"?
> > > None of the existing tests should be moved here because they do not use the
> > > ezecargs variable (since it is new).  I'll add a few tests for this built-in
> > > specifically.  I'd be happy to even drop this patch and not add a new
> > > built-in, but it seems somehow odd not to provide it.
> > > 
> > > > I'll look more but am certainly unclear if we're talking new D features here
> > > > (and if so, why they're not tested).
> > > > On 1/28/25 01:31, Kris Van Hees wrote:
> > > > 
> > > > > The 'execargs' global variable provides the psargs for curthread.
> > > > > 
> > > > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > > > ---
> > > > >    dlibs/aarch64/5.11/procfs.d | 4 ++++
> > > > >    dlibs/aarch64/5.12/procfs.d | 4 ++++
> > > > >    dlibs/aarch64/5.14/procfs.d | 4 ++++
> > > > >    dlibs/aarch64/5.16/procfs.d | 4 ++++
> > > > >    dlibs/aarch64/5.2/procfs.d  | 4 ++++
> > > > >    dlibs/aarch64/5.6/procfs.d  | 4 ++++
> > > > >    dlibs/aarch64/6.1/procfs.d  | 4 ++++
> > > > >    dlibs/aarch64/6.10/procfs.d | 4 ++++
> > > > >    dlibs/x86_64/5.11/procfs.d  | 4 ++++
> > > > >    dlibs/x86_64/5.12/procfs.d  | 4 ++++
> > > > >    dlibs/x86_64/5.14/procfs.d  | 4 ++++
> > > > >    dlibs/x86_64/5.16/procfs.d  | 4 ++++
> > > > >    dlibs/x86_64/5.2/procfs.d   | 4 ++++
> > > > >    dlibs/x86_64/5.6/procfs.d   | 4 ++++
> > > > >    dlibs/x86_64/6.1/procfs.d   | 4 ++++
> > > > >    dlibs/x86_64/6.10/procfs.d  | 4 ++++
> > > > >    libdtrace/procfs.d.in       | 4 ++++
> > > > >    17 files changed, 68 insertions(+)
> > > > > 
> > > > > diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
> > > > > index 70a43ddf..9c06fe1f 100644
> > > > > --- a/dlibs/aarch64/5.11/procfs.d
> > > > > +++ b/dlibs/aarch64/5.11/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
> > > > > index 70a43ddf..9c06fe1f 100644
> > > > > --- a/dlibs/aarch64/5.12/procfs.d
> > > > > +++ b/dlibs/aarch64/5.12/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
> > > > > index ef27bb70..2824d137 100644
> > > > > --- a/dlibs/aarch64/5.14/procfs.d
> > > > > +++ b/dlibs/aarch64/5.14/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
> > > > > index cad2d2c5..daf30745 100644
> > > > > --- a/dlibs/aarch64/5.16/procfs.d
> > > > > +++ b/dlibs/aarch64/5.16/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
> > > > > index 6b1b1b9c..3594e5e9 100644
> > > > > --- a/dlibs/aarch64/5.2/procfs.d
> > > > > +++ b/dlibs/aarch64/5.2/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
> > > > > index 70a43ddf..9c06fe1f 100644
> > > > > --- a/dlibs/aarch64/5.6/procfs.d
> > > > > +++ b/dlibs/aarch64/5.6/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
> > > > > index 4cb7b77c..2d52f079 100644
> > > > > --- a/dlibs/aarch64/6.1/procfs.d
> > > > > +++ b/dlibs/aarch64/6.1/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
> > > > > index 4cb7b77c..2d52f079 100644
> > > > > --- a/dlibs/aarch64/6.10/procfs.d
> > > > > +++ b/dlibs/aarch64/6.10/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
> > > > > index c2be76d8..7679db2e 100644
> > > > > --- a/dlibs/x86_64/5.11/procfs.d
> > > > > +++ b/dlibs/x86_64/5.11/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
> > > > > index c2be76d8..7679db2e 100644
> > > > > --- a/dlibs/x86_64/5.12/procfs.d
> > > > > +++ b/dlibs/x86_64/5.12/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
> > > > > index 28fada6d..3a348ebc 100644
> > > > > --- a/dlibs/x86_64/5.14/procfs.d
> > > > > +++ b/dlibs/x86_64/5.14/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
> > > > > index cad2d2c5..daf30745 100644
> > > > > --- a/dlibs/x86_64/5.16/procfs.d
> > > > > +++ b/dlibs/x86_64/5.16/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
> > > > > index 08696cf7..6ad926ee 100644
> > > > > --- a/dlibs/x86_64/5.2/procfs.d
> > > > > +++ b/dlibs/x86_64/5.2/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
> > > > > index c2be76d8..7679db2e 100644
> > > > > --- a/dlibs/x86_64/5.6/procfs.d
> > > > > +++ b/dlibs/x86_64/5.6/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
> > > > > index 4cb7b77c..2d52f079 100644
> > > > > --- a/dlibs/x86_64/6.1/procfs.d
> > > > > +++ b/dlibs/x86_64/6.1/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
> > > > > index 4cb7b77c..2d52f079 100644
> > > > > --- a/dlibs/x86_64/6.10/procfs.d
> > > > > +++ b/dlibs/x86_64/6.10/procfs.d
> > > > > @@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
> > > > > diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> > > > > index e9d50349..827d6b81 100644
> > > > > --- a/libdtrace/procfs.d.in
> > > > > +++ b/libdtrace/procfs.d.in
> > > > > @@ -307,6 +307,10 @@ inline string root = d_path(&(curthread->fs->root));
> > > > >    #pragma D attributes Stable/Stable/Common root
> > > > >    #pragma D binding "1.0" root
> > > > > +inline string execargs = d_execargs(curthread);
> > > > > +#pragma D attributes Stable/Stable/Common root
> > > > > +#pragma D binding "2.0" execargs
> > > > > +
> > > > >    inline int CLD_EXITED = 1;
> > > > >    #pragma D binding "1.0" CLD_EXITED
> > > > >    inline int CLD_KILLED = 2;
