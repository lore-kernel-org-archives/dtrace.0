Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3DA2C9A
	for <dtrace@lists.linux.dev>; Mon,  9 Dec 2024 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733763433; cv=fail; b=jS8nNJQ8FfINjkfY3ARkhcrp23gpaQJuDKuQn2HJBK7LifBciyRI3FMKUujgB/yWZn93349baZLKOv9+UxUK+oMAdPJjRTGoTD9GjzxjZPOWfASMnsyI4c4xudqNN6W/ahPdGfMaGU5eIIa46P+6u4ITvGGui8z356nJ5zrQ07o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733763433; c=relaxed/simple;
	bh=yQcw3p4vezwbY7UQbDU/aPP6+eOZst6kr7nWYnRxv8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FOOCTAthYrsDy2se1xOMeK9IK5SnWt7PUrLKd1GOQ/ZzgVQxkoKs7xhyw30XhQ9rrI9Z9mGczkJMvWuVakhTv0zkwcJpbj2lgtf7Tsb9GN/9GxFqMdcmazQ29voHXDee/VmBWFv5ySaNWPGMqfQhQDmZv7m9kgh7tu/U7f6XFr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yg2elwhM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=d3h/7TH1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yg2elwhM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="d3h/7TH1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9GfrGT013907
	for <dtrace@lists.linux.dev>; Mon, 9 Dec 2024 16:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=I7lBosTcnEScJJlAP1
	a9MqvPwn7Z/iLghMg948j9gXY=; b=Yg2elwhMwTiFBWSdC3SboZWIWrELp3ZRyH
	dojgxslm9IY+oM8v7PiZxn2hnTzTMad5vPmMV1CzZ0FRzfa0nmhZy3lURXxgcpeo
	44mjGg6AVaeIGxszxDwtKvwVNhicRNQtrlvojr4cUq1ZYVNO8Pf1/M3ssazyXDXK
	PDx9XTZ79Z161d2LxI43fcunjpXjm0ttQR8rHi0lYc46lykMbaDUh0e1njv8hvgf
	s1c4IGnfcjXq91GI4dSjyN0t/SOomONMQMtU4WfpbrFUVts6qGiipt8EqN6ggEXW
	Q3wkA4QmJIxMnxb8jlET51i09QJXxP4kB3+NdW6Ii0hNWkmDWvTQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ce893mp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Dec 2024 16:57:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9Gsbix036228
	for <dtrace@lists.linux.dev>; Mon, 9 Dec 2024 16:57:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cct7ha1v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Dec 2024 16:57:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyc+pBUqpncQ+AslvkEWcEXmHuYKDy4N4FvJxjpib99c3G3hnYwdstv8o/6CzCELiwdV5qxuWlPQqcb0beFX1JpjWER73ez9DmW+jOnnG7WMibAaK9GG4B7dDCOmAmxq05l1c22wwEm5ZTc5L6d4dlGTejmGMwVUfqqsPhrKxDYE8fJMbgmDYglrfeA1Zf1NtWKU2gX0fbmd2etmojzM4Ixi4g8f0zE67DySmdhVLCiNq00rKIEOtfZVcuiL/+67yK60v3B7yIwhPzjac0rlCZcpupQaYt1irbEG+Qj1YLjy4bKaGSh+FFcH9b4jSWb9o4EdT8EK1M7QKjNCrhZOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7lBosTcnEScJJlAP1a9MqvPwn7Z/iLghMg948j9gXY=;
 b=dlQo0U+W2tvwQfpiJH9rF+Mif0FewwEnGfwVbMX3q6Aqjur0v02bYs745vlaEn6mTHs2Tg6uCELLMKXkJ4MSqkpRd4Dao9Sj5Te3V3Otu/nyNOsZIgopOCwGg+8m4asyy1EHLW2VsgSUK9/L7QkYu8alXFWhukylxSsYjax0GviLbKr9BOV+BDNhCxw32K8mrpr+/aMEMlu5J0vUsVEwVDvmJn4QF4QT9DK911hhGUKfZrlVVFqllap9rpkQ2ch6cKDAuzNFbOP5NlyDXe19x6OZ1Ua9ghpxqtKYKusV/3kH7NGdqUezm+QPfNlPrV9yxch8g4ZkgiugvfwzAiRedA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7lBosTcnEScJJlAP1a9MqvPwn7Z/iLghMg948j9gXY=;
 b=d3h/7TH1el5gBnav7ziBdUWaSy7BpbKXN5YHVcmaTsTtezovm6YfHFKNzyMHCC2ROXxL0E3VOcRB5W+ZtHbYPe/RR2eR/FxyIrk6b2LCF5GIAcZk6lD0idMTQj2vN5/vEUA9CaChZK41ewen8z2W4jSN9p0R591iR5hfLnoC+Cc=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by PH0PR10MB4421.namprd10.prod.outlook.com (2603:10b6:510:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 16:57:06 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 16:57:06 +0000
Date: Mon, 9 Dec 2024 11:57:02 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Alan Maguire <alan.maguire@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] rawfbt: new provider
Message-ID: <Z1chXi8eoRFposu4@oracle.com>
References: <PH8SPRMB00374BF4E363FDE8B36D9E86C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
 <7b734e3f-2892-4282-9067-1b3ed69a8262@oracle.com>
 <Z1MncJ4JVhQBc3Kz@oracle.com>
 <827f0154-48c9-4092-a8f9-5f5116049899@oracle.com>
 <878qson7kw.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qson7kw.fsf@esperi.org.uk>
X-ClientProxiedBy: BL1PR13CA0431.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::16) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|PH0PR10MB4421:EE_
X-MS-Office365-Filtering-Correlation-Id: 473a5d32-1493-44e2-02e0-08dd187282b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OH36mvYU//LfnMU/dPVXloWlpPZPRUU8wR8mhlhBeub//u3Qmb7HqClQAyXO?=
 =?us-ascii?Q?8vD/X0YWmgcGwvYgKQ/a9osfJ6V6Ta35G15XER1kae7oB67x4m2mz3ORE4iZ?=
 =?us-ascii?Q?lqNSSutvOkkEfTTbSaDAAXu/5GTR4eBHY9kQzI10k1c+yNN6m15l6CR4zyqC?=
 =?us-ascii?Q?Q8i5AJltCeh5hHeat0potS8KZzj+yZt3WfOBdOk6taQVBNb3f7L9ImXZ5MIt?=
 =?us-ascii?Q?mLxPnnkqBdIpwrVYKCL2FGARp/HTvgNlOH6gCAXrcLz2ZWPtTqv3Of+ZT23d?=
 =?us-ascii?Q?PgLk0pDyMtIEIZRVo/44zednAjea4kTlQ76fvoEPRdPB2pokHq3uvtCrqEOI?=
 =?us-ascii?Q?YwKiiO/ESv9RLVwq4SzwV7R7jrLylLWXDlAwxrNM+tpXVXNQM/jB3R6fy0Hr?=
 =?us-ascii?Q?vCGlcLPd0GbSf8ZxPIFNV0nYmYIoUwKmdB2dRlO1mJJANgPM6Kiiy+YkC+ph?=
 =?us-ascii?Q?HX3tiA6BJpdYOch2bLyKyFTkRCqXvttq1xI5aR7Xpm2rbcJr4yU9mHGjlE0e?=
 =?us-ascii?Q?Z2svefJsH0BtLMxoNdOME+qCZXjGnfEPxGJVGfiIr6w9miZsZnNVIHtbCw8L?=
 =?us-ascii?Q?S5Yj+ymicDMWFYcLfxqcMsb0BshXtLTkxJEtb0mgYEurg0fer/VVyZ0TPME2?=
 =?us-ascii?Q?sB/uARNLjEaCqG/NoI7kRAVJ8Xa6xkdwUGYr8Nd3lm6pUw1couA/eJfFosVb?=
 =?us-ascii?Q?fWTb3hE7u3Gc4Cwa4Bkpdwow2bC2YtEPKXJ2kkV6jYewwBlCYVLNevJohAD7?=
 =?us-ascii?Q?40i0sA5U8hI76CW5cgb23slqVVXOr/3km17IzAijjNcgeeaWBQUg30uio9R+?=
 =?us-ascii?Q?9NcdTOmKAKMcp8oWoDZZ69iZZcC22ts2UaKaJurfVYr7PdDyhjSMWw9oS3U2?=
 =?us-ascii?Q?qCHAeLVbCnHQEFTzw/msV4mA3++AhQlDbJFk39O1KjVvEh9T+OeRDcc4Euak?=
 =?us-ascii?Q?GGh0Gr+7mDsYH4xf4jOZBOyHTRfRMvujjoxb6VOte4azTj+3Rx4JWtJMvBRw?=
 =?us-ascii?Q?kZmm9E8ekT05K+QNsu2iFi6322e0+Hjafpf3F7Tj/2tjT5aha69QyW5AWS8Z?=
 =?us-ascii?Q?9FH6GhVDSAs+oCepeZnBajRd9XtD+4BoV+rdOtmz623nrUFrFAuf9ZGrQd8P?=
 =?us-ascii?Q?WVkm1ZChbH6lEM5g+QOUlJgJXFq23PMTk6036FBWIH2KrYi8ScjsMF2A4lPY?=
 =?us-ascii?Q?TL+OBJO9Li/0Ng8vpD5XKS4dgOSCqlMNp/+idGBkovk5Yvgw22RknNFzNdUT?=
 =?us-ascii?Q?TeWa7H3iNmvTChAh/08ORY5eibyAddrh03QJ3DK87/7yDfO1PWkO90c9rG6l?=
 =?us-ascii?Q?zXkXHKhmh0OGTPhyhEBhIuCaIgYIwX+R8VWxe25LvH5TcuRTBErVZINUYJp7?=
 =?us-ascii?Q?OVmNVJQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ZuXK62wwQaJvaSjvNXoPWI/JcC5KS7BJVKFG1Q4PDGm5gbgSc6LcNLG4jL4?=
 =?us-ascii?Q?L6KxonSAYhuq2AqygsoPBf+SABEXp4ZUHUQgczBzVypXs+bFCudG355najW3?=
 =?us-ascii?Q?zBHyCsMN6j87M5iXgL9w+iLiW7FhF1FYRfLhcy/c/0JwvZz6SCbKbzAaGtWb?=
 =?us-ascii?Q?4WFhGaR+cjcG3ZcRSby36vkYZVdDsZTQJaTlX1gz5PP7iZySqM2Olj/SRnF6?=
 =?us-ascii?Q?nJI5bmlM2Hytb0va73/eAACFgW11CpBUs85j5ow5fZx/5t56SW1APuEUs/Ef?=
 =?us-ascii?Q?JKQ4kbn0zqlgs29UftG93PO+8KqixssZsUgXFAURre6xXUVFpOhYlYw7tC83?=
 =?us-ascii?Q?7EwO3PcA5HareZcRdqzIZhQuMVJ0RC3WKMYYl49LXV1lupLNhrC+lutDhN2H?=
 =?us-ascii?Q?vQOy4EcI6naUBItOTyRafHgPUfjVhWHughkTMaTqCgyEU+E3HAPgvddPrZUe?=
 =?us-ascii?Q?h4CeqgGte+rHUsrXCnipB6mycsjADnJCOGVPGXxMp82nkQWwxOj5zz1uPZcr?=
 =?us-ascii?Q?zmT0toYheLRjog0lfQUs8q/0ew7MB8qMWlSuSTp/+z6j+Es0qx4ZIhErtoJa?=
 =?us-ascii?Q?kJRiY62bbJ26IBv2BilwIupjLWB+DI5SkPBNpor2j49vQyKBcjnL243IsdOd?=
 =?us-ascii?Q?z4NRPo19X030kEDSNlujh18UjUgRy2Hz1agqNFXyivKrTNhwmw5wKbZcsxXA?=
 =?us-ascii?Q?aS+TCOck+JfAuG5xbybwCnfoGKQXbe60P1EQZ+hToRHcPTJ1+Dlot1xpHoYt?=
 =?us-ascii?Q?N8Om0z9MfvYYHRY4HegyfL8nUKmsLJVqIGBYCdst6vy1DOZABfWlwFperY+n?=
 =?us-ascii?Q?+YJOprreejtXtRInmnwmS8Mr/zaA76jyGKALp/SSbSor0OXMIMknJey9YoJ2?=
 =?us-ascii?Q?2oKEJe3WZXXvKJIMSo9pQTh/dtwOLazEFZG9cMFRM2365sza4Dcj0UaqUd4F?=
 =?us-ascii?Q?QvKN7vMF4riAT+joU37dzcIs+j+E/2z6vpcZz9nEEvb3VZN9PzIEcR4q4hBQ?=
 =?us-ascii?Q?5rtm5xow7xCgrxZaYwkTyrZdCcvbQj7rYmiQ6+GCPwNE6MYL+5PZEuz2MZyN?=
 =?us-ascii?Q?SPwEm7uPwoPCSqqrz1ip1EKg4Y3hV4+GJ5tERPKN645fSxnU071WrlMxvD8w?=
 =?us-ascii?Q?iR+6pj+UjNDWF4eGRIGRfVhWx9pkdneDuXsC1CJlTFkfmPN0Xxj1xFOI9Uys?=
 =?us-ascii?Q?X4U57fuadw54OSuz7b6MUBOcekwFMK+TIifdwSTpngK3YcZ4Pm+lGFoGQIbe?=
 =?us-ascii?Q?u9tARt8MKR1lnq+eo19XphGuw60t0Ag/8VltcbYGV7Al5Jem7i7uVrwCvNK+?=
 =?us-ascii?Q?p+u+O0vHqNz5CVjWpkKcQ//v8rAX7UXNeV0uALWph1xXWrxgy6hwKRTY2a0P?=
 =?us-ascii?Q?YJBfJl9xEUs3bhNORh35FjncDp3n9IK9sVDs00m+nFOqzdzL/p7y+i/Q8CZg?=
 =?us-ascii?Q?bLW7jZdW2JOpuIebEkYr2huRL/C06lMKseaeEfbmkvV+U04NqMLyMxAjSYf4?=
 =?us-ascii?Q?oUWcA62owISZHyeda8EVYNNyAO/4zhYy+v7lBAtoeU63D4G080dH2Jc2FBxn?=
 =?us-ascii?Q?ve9TJ45BxHxPP1chhnC4ueORxAbehOXmA6E8bimZpQZh2OFw923LAgEiYEIx?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fvYaXjNfAeFNY7qw08nIPAk/GeVo9llLkNSOGBKsYL4XJAr8PqwY6TGIHxeOGdVNa/z5PwEx/jtHDQBXKswruKVswGhkzamMGRU1HW/10Ekj1BbifK7hve6CRn4S/9d1wuQlu6ZGBiWwn1Wjz6SJjIc9pg28lzx12Sng7Yf5xTpVDD9Gvv8VHfAoHbPFrPRgBBFZ4O10C0JO2tNpJtotQTxfZqqgtal+T9g4SRFjlnNDjP8lLBesyQ7RAxhlzZmMRvwLAtgWSLQNAmLw484id/iy0JlhNE0xBhkx5RnEKys4K7yMFsZID0QMZaNA7o21vP3AO6GHnEYcn6hW/C47GIha3Wm9M4gaJe7SpLVn0cZUYdERX2cHnMTX5S8Cqdi53HnFqRP7nBtHmX3t35DPwa31bXQSgtdGZ9YaLjAo3wah+9mTxx5aJwu7nd99g+ynZ0CyuF+tQtoMC9gtf0zSxdyPql/BFRF/XjEw6BuSkazvJa27Hbwfv9xJSg5GQWXxyz7I44/t0lDP6DBMXRWU/qqVYCR1XX30vZWmaH+J5m3By0y1+WYlUHu2n6A1jvCL8Av78sMPDiywKXI4fczNNHMuUO9XpwL1+Suv0eiX2UA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473a5d32-1493-44e2-02e0-08dd187282b9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 16:57:06.6139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffHiiaX8Uj/LumliYJCXBt5WvMHLM2Wjik667g8EjQmunMxEJOAtrfB1/wAtTrURWd3yWMkHLqB+j5Ww0AU6XbsFWKUE2qNKW+aBBxuq3Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4421
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-09_12,2024-12-09_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412090131
X-Proofpoint-GUID: 2ZnKXr49lTB3gVTcphT7U-kZ62TAysyt
X-Proofpoint-ORIG-GUID: 2ZnKXr49lTB3gVTcphT7U-kZ62TAysyt

On Mon, Dec 09, 2024 at 04:29:19PM +0000, Nick Alcock wrote:
> On 9 Dec 2024, Alan Maguire stated:
> 
> > On 06/12/2024 16:33, Kris Van Hees wrote:
> >> On Fri, Dec 06, 2024 at 10:35:50AM +0000, Alan Maguire wrote:
> >>> On 05/12/2024 19:42, Kris Van Hees wrote:
> >>>> This provider provides access to all kprobe-based probes that are
> >>>> available on the system.  This includes any compiler-generated
> >>>> optimized variants of functions, named <func>.<suffix>.
> >>>>
> >>>
> >>> This is great! Having a rawfbt allows users to still trace cases
> >>> where fprobe can't currently handle.
> >>>
> >>> On the .suffix; I get that this is intended to be a raw provider, but
> >>> would it be better for stability to expose these functions as "func"
> >>> rather than "func.suffix"? It becomes difficult to write portable
> >>> scripts when suffixes are included, because wildcarding
> >>>
> >>> rawfbt::func*:entry
> >>>
> >>> ...to catch both suffixed and non-suffixed variants may end up tracing
> >>> func, func.suffix but also func2 etc.
> >> 
> >> The trouble is that exposing <func>.<suffix> as <func> will mean that you
> >> automatically end up trying to probe *any* <func>.<suffix> whenever you
> >> place a probe on <func> using rawfbt, which is not necessarily what you may
> >> want.  And there would not be any way to avoid that.
> >> 
> >> But by not collapsing them, you have the ability to catch them all anyway,
> >> if you want, by specifying <func>, <func>.* instead of <func>.
> >
> > I tried that with the rawfbt code but got:
> >
> > # dtrace -n 'rawfbt::xfs_cleanup_inode.*:entry {}'
> > dtrace: description 'rawfbt::xfs_cleanup_inode.*:entry ' matched 1 probe
> > ^C
> >
> > This matches xfs_cleanup_inode.isra.0, looks good so far. However:
> >
> > # dtrace -n
> > 'rawfbt::xfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry {}'
> > dtrace: invalid probe specifier
> > rawfbt::xfs_cfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry
> > {}: probe description rawfbt::xfs_cfs_cleanup_inode:entry does not match
> > any probes
> >
> > So the absence of the non-suffixed function (which we included for
> > portability) triggers the failure. So looks like it will be necessary to
> > add -Z:
> >
> > # /sbin/dtrace -Zn
> > 'rawfbt::xfs_cfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry {}'
> > dtrace: description
> > 'rawfbt::xfs_cfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry '
> > matched 1 probe
> >
> > So I guess as long as we document this clearly for folks wanting to to
> > use rawfbt to write portable scripts, it should be okay.
> 
> Agreed. Documented behaviour, trivial workaround, maybe can be improved
> later -- maybe we shouldn't get a 'no probes' error unless *every probe*
> in a probe list is unmatched? There are good reasons for both... maybe
> we should add "foo & bar" and "foo | bar" and parens for precedence in
> later releases, but this is huge overdesign :P

This is indeed proper behaviour.  If the probe does not exist, the tracing
should not start and an error should be reported.

Since these probes are made available by the kernel based on the kernel build
(i.e. the functions that it determines can be probed using kprobe), they are
not at all a stable interface and therefore portability of scripts is not at
all supported.  Often that can be resolved with using -Z indeed (or the
equivalent pragma that can be included in the script).

I could *perhaps* see some value in someday being able to specify that certain
probes are required and others are optional (in a script), possibly using a
more refined pragma that assigns such status to particular probe specifications
but that is certainly only a vague notion of potential future feature :)
