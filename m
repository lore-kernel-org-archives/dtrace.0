Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D2E28134C
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770921829; cv=fail; b=bKWBZt1KLy6TtHh8tr22Lr+mSE0pGcMBR2bHjmAp3toXm8EFNF1cm7zUAHQZ3gXoK3tZRFDuvuZNItSKCvTG5xZejo+JooBdS1pTav3W/h7B7noi38Cx5nRMjtOObNpbGIUV6uHTbVyPjwgQf5Um/2N0xSeGNH2DNZ6OAAtHi9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770921829; c=relaxed/simple;
	bh=/MZ68RRLUZ58mW/4fNdxW0D8ytY2n2Zsa6X8+GdT6hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GFTFJD+b3IzJ+Vf/Q84B3JQICiRRZdGYx4jPq/x5Kp5+ADuCMlPVAHejKWHHycIcpA2LXvFR/C6FKA1oxiBvjooWWVUg5EQ1DrfQx+pxHggSPVliAQse5l5MSUMoZTYp8iGiea7MeTsCRUp7W1CPewkdULsZVHIsdjthhi0NYTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JQLAMRey; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B49istMZ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JQLAMRey";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B49istMZ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNDrk1041603
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=l4W9zwK2+sZwKnYH087XsfrrWtYfnCnYlxltBv2AvTU=; b=
	JQLAMReyvJ1f/P+7zfI8Xa/0CeoG1XHiwOFhEjRpv0y6Var7T1+E20JwK7EPVXio
	wiFjxpQkzRSvLo4zv/tDVpxwLfBtG1gsYCo9MBfIICtErZ2P8RNCOydr2qWoz2RQ
	5gHwfIZVo7dcupse1ldJK2Ya1lZcIuJi2OaqJTAYL8YQmVfglCQLeEs6gid4tGGz
	k+1EwzUGAia3qtG3HKxdNIZqzbYiw25uGZFiDPrz3MHLoZG+10D5PxOKNHoPuvc7
	4OsZE/PdVXmNC0aFMY5ZEenJm7kuvhLV0avfCt5Ds4FfMS4reBBkq/PacCATRXPd
	GuiNpeMContcowcBu7UHmg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xfp8d27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:43:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CIbCQX033654
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:43:46 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8248205w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:43:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+GzuMATeSUb6CSaRR6Gfl3hocVFEHIE7lfyQFBRh8Giu/ygi6xiDlKGitJJrLhaOBw9SoYgaXFRaGJoqIqXLkyRA1ZrVtdAvzn5MWJJtcJlwvo4dj9Xoz4E16mkKvnAMKb+jajyx9JZJZcTG3eKLvOfoDHKZEJiFVnPE/3bS0GwckmiikDNQp5mAVJvm/jtJuDCafFlUcIpTbFMXMNvqATE/QtWhT3/3h9YLwigUJsc2FhIC8cXol+ytc7VJIMdNJSrgiSD5hpV5vm7CSoyIW5WllhYwH/QIvGTfANwhbM7R5Jp0eUwgVY47VYIcDrL3Emi1hLuFiXfPhqMtrg/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7Zuv97XgcxjJDvC7mTIPjJa09NpHdr0XxZR7N38RNk=;
 b=JVbSOeBiDuYTu1T3lh5CY/HBjtk+S65/yy/GZqifq7t7YpMlkFjdRmLtc9QyEfRqoUsVJyVzvkNa0HTseYl5hDbwihJZuuX9CMViRRjxsM8aduAUwl9+l1mFBmCBML/O5t7aunFhCLI6Ynm47OzIFox6MzoTGAo0Nen/WVlwisIDj9C3sk4V4wuqJkA6SOspEQlsp9FKvrRmj3jw5oEPdbO7VbLL+WlUoSDdKbN+rpDEfvRqEpXmQj97Wu3u9hoE5SuatbQ3W1KzACim8yHEkGG+BXluCQC/O/YnQU3maF7Qs7NDjViv0e9HIMzwaKaz/Vh+27SmDzVgGtSjRVYjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7Zuv97XgcxjJDvC7mTIPjJa09NpHdr0XxZR7N38RNk=;
 b=B49istMZKgyRA101IU1Ku0cLzSAwSiryu3rkXJnqn17ezxadWy9WHn3tTZpElcXrIWtm+CpQqL3IiTwV9UXtNmWh4fi4BHoguaJipuO7Bmkhitmfy/HxNUzie3t4bHVT6xKfg9D2e5T2Z4/Y9EM9VPNXFRtEesRMH3tLFOB8ErM=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ5PPF07759F8B1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::787) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:43:42 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 18:43:41 +0000
Date: Thu, 12 Feb 2026 13:43:38 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] dtprobed: use /proc/$pid/map_files,
 not the filename of the mapping
Message-ID: <aY4fWtW6pHgFUkEL@oracle.com>
References: <20251202230453.124306-1-nick.alcock@oracle.com>
 <20260120162051.183028-1-nick.alcock@oracle.com>
 <08f076e7-9573-7ca7-f89a-a3fd33bf683c@oracle.com>
 <489a5755-af8e-6eff-48a6-9fbeb8c9b4cd@oracle.com>
 <878qcxomfi.fsf@esperi.org.uk>
 <aY4buJOhWlmm9CvW@oracle.com>
 <aY4d0ttnWiIzwfWu@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY4d0ttnWiIzwfWu@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ5PPF07759F8B1:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b10c1d8-25e8-4d1f-1d40-08de6a66a44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?NOLI5GOnxxW2Vj2wJU5RCsNFY9cJSM3dqyIz+TXConfsSpOcp3hqMVEZN7?=
 =?iso-8859-1?Q?XqWkLMZ5OpqmgrQrHpVjzkZwQLoj9f33WRqZ0bAmzvKlaKAKy1pc+qhsWj?=
 =?iso-8859-1?Q?+PvEoR54rQfTx3/PzXAGHGYw5Xl3wMjnjDUsFxk+RwaWmkEGWvlcmNF4Ql?=
 =?iso-8859-1?Q?aQCGo5suBblShFgS2clalmtg+vyvMk+Rs5gz2Kp0vbuiVE0PaLtcGGBw9B?=
 =?iso-8859-1?Q?EA+44vzbTYW/iACHBwU/wAKBwUGL+XOmuWLjROAxbeEuE6rOMumImhWK4Z?=
 =?iso-8859-1?Q?NRNPRN35a8/Y1neA5YZ1WGw8BOri+7FzkqjqYYNc/z084dveHOsvzATMai?=
 =?iso-8859-1?Q?FBxdQzMRmoIRqvmBVp4vfyDjakE7uGj8qAQKZ4bg+a3JqypSPWkq0NO2wj?=
 =?iso-8859-1?Q?z0SIBORo0THxTyW0En9ur5qo0PW8WnjsYl6gIfTMyjP7jBMgjMiIpmW+Lx?=
 =?iso-8859-1?Q?t1GEgoSd7xqfvvC93QTxqX27wpAY1ivd1GsDqRyBnDlkq5dZjq/lyWzDua?=
 =?iso-8859-1?Q?Ffe5fb1N+4lVK+m5qEOYuWsfUVqsTOGNUmrN181BRukIgWVWVAFdEQmelk?=
 =?iso-8859-1?Q?V3nfczohcd6T4C0M5PUhjXImMWLO6rGFzZnl1Wt+YR7c24ZoqaTb7qra6A?=
 =?iso-8859-1?Q?2NBHWsX0neHjQmivCOCP1xPoFdnM7HHJ5n/yUih8bg2Kec03m7pV7ZPLhf?=
 =?iso-8859-1?Q?hMFIo45bgkXJtTrjjUYNRoyoXoiiyQmf4kTWi1qCq2mahphkNI5Qjt5ycX?=
 =?iso-8859-1?Q?t3t0KIbYXW3XIgipIShW1jQI5aoq3I7YC2Y/kYifzGBJODozJio91wZH2g?=
 =?iso-8859-1?Q?4NjACIJ3Djs5p+X+/WE1PpuKtqrLFJXsFqJAJ/Ji4JBMevxhJFuLruRBng?=
 =?iso-8859-1?Q?urkZMbbk6qeZ0M3amUov7TKSROEnGLJTfmYKpwGVjuDuJg9FBwJsXCSY/p?=
 =?iso-8859-1?Q?0eR/RqwcoRF0bE+x0+/LRhokmvtj7EnmGPdWgjZV9xDt7N9ysVmUDtL2mT?=
 =?iso-8859-1?Q?NePs1WKHHLP3zBUvk5P71FMgLHnGvhSuvKjEjw3Ah7brR8NZogGwBuS8iH?=
 =?iso-8859-1?Q?CaFDLkKRz51omw6qlP0Os4I90ScdUNXWPxinzh3FNZQ+Km9lt95YsAOg10?=
 =?iso-8859-1?Q?KqRwCTR6x14i1b/nlKVe37yV3Zu5vO0vKucQGvQuM0wwttgVbIdwKsCPXk?=
 =?iso-8859-1?Q?bgbQzQgoFH1ETnIStyFtFgOlXEkyUBQWxGdL1lE5fJygXISQV+j0OYS2sw?=
 =?iso-8859-1?Q?//6RpUSCYm1EscYPZYLFRj1PJhjquvLxaDJAeTWrD/nlb9na4iSE75gRuY?=
 =?iso-8859-1?Q?b5HU5T9qVEgilxCln1qdudB32LvbdRqSThUDYfHHuuVzsGBR7xOArW+AQS?=
 =?iso-8859-1?Q?OE9OWka8EmeYluDCPQ0ACc3m2mNfqDicv0sH02g+uzKd/+dIRqMtJB4I1U?=
 =?iso-8859-1?Q?+aXteU+sAlgxQOjrMKBNrlV/k+vs5zcprsbFRNk7Gbge3MKChwwSC9VqPw?=
 =?iso-8859-1?Q?SP4jE48v/qIbBy5mOURPz6WUMRXpWpDLoeUVbYskrvrX1US8NqCSen34py?=
 =?iso-8859-1?Q?pFh5ko/LuRQHkJ+6fB4w//3h5rok8k4uB51SPGKPJK2+Qp2tkusaogE8wR?=
 =?iso-8859-1?Q?E6VHNlmeX/9ZA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?WQS/60laVgGsD3VALflHEklMnLSZnEsQCOslwgLe3g5FjgrPhoU8YGRRND?=
 =?iso-8859-1?Q?OUA0nPLNp9el7Fe4cavCPAwUN1XufBL1HfYQXs3W92yv7OFjIAWojR/5Nn?=
 =?iso-8859-1?Q?SmTlJDKaTlbYMYJEbAU4Wsu2pTVyK87J2wwZ2+u9ul7L/T/L0/jJfBZve0?=
 =?iso-8859-1?Q?GE60YI56r2cbAhdZ1c9c2OnuWKW1RMoY3tIl456I0f7IXaTCbPgTDRGnbB?=
 =?iso-8859-1?Q?x8abpJePQC11V8+vpk2x0y1IYDmJ0PQWHUxtdhDCRO4si4quS/udIx/EWV?=
 =?iso-8859-1?Q?XISAgEQNouHEnYP0/U3oyHM647e3df3UHb1mbnX1TPN1s1uQrRfglnbKpv?=
 =?iso-8859-1?Q?af/U58aHXaI8iDMu8RhItETDJ0xWYIv2ZSnY0zvoHLRiBB86hxH7SYAvdD?=
 =?iso-8859-1?Q?A7ZdEDqRLfuJmoez9i8AQBN1zKnYEAHy9/4EeLkSFoj3/pxxbCp2G3XvB8?=
 =?iso-8859-1?Q?iUxRoSlb/L3o68e9nUQVRfZ4PSZY5WedDkKJ7KUsMgkpBTYW8QOZt+SnAm?=
 =?iso-8859-1?Q?9sbIAIoon86uzfhys+LjqnzH/HKRtqXcAt7qPeJmgXfTmNWhyvmu9aVC2z?=
 =?iso-8859-1?Q?fG6HGJP7shmt7qijjbx29aiHOATBPSq1G2Jqdhz15RGCVyi6wLXyMhI/4F?=
 =?iso-8859-1?Q?n5ZlIkn9+Br90b9iLGvFL5Lf5rb4ruoG8a+jc19oKnivZDFwR39PvZ58qz?=
 =?iso-8859-1?Q?zPBePWBB9wjDheAfTJDrJsvSodTk5FpldzOjPl54ptZ2neBkfBjSs4UC+t?=
 =?iso-8859-1?Q?VziIvFWp4QuQl/EJRTtNEsUSjYSIbS578w/GkyPvgsXXuD/0MKSla2HZpw?=
 =?iso-8859-1?Q?w+68mF5SAeznvHBUNOY/kz7CTLn1/D7aEmyx9XnFHycYjo9mBzdtxI2NSb?=
 =?iso-8859-1?Q?DyGkUhsZXnlUYGN4+wiMG96wjLZcmjye6CzO/hVND+IZxbrOMmMgIBtKZm?=
 =?iso-8859-1?Q?GDxAHJwbxZxo/awJ/sl8w5+7BlMXp+lJArYE/3L1FrSxToJ01dLE7H5qxk?=
 =?iso-8859-1?Q?7AmUJBqdiq8Mwfb0iXLqb+CRRgJPECUWweZnHpbCVuHCvKyQMoPkrU9u5b?=
 =?iso-8859-1?Q?X/fyH+6QV1ZgtcrABkioow2AF9ePZub6bNls8oKbumV/MmrI3U76OvflTi?=
 =?iso-8859-1?Q?X2jsJMQ2gO9OjSrWOub1Z4a8lqPiVVKDUiurthMkMD0UbTYfV4CEW8nmBc?=
 =?iso-8859-1?Q?Aq5VI74G8Q5n/tSMOApTWmzpfsVfo0tzsmBtWftC8V62F0IAbsdfk4P6SX?=
 =?iso-8859-1?Q?MNLQSZxyyMqOeN8TmMQ5AvZ95+k1DjFIH2fCYH8EaKFLjheL6lGK3v6gi7?=
 =?iso-8859-1?Q?6u5QJfh6xYSX9+P8RJvikSEgv0qfiPksmDoUepDdabbsDwEltOhTNWk5/l?=
 =?iso-8859-1?Q?1RRMhbwhW7rcxlo/5MUZu13PIHIPgTl0jTc+VMvsCfG8bBCqD4iUzJr4/c?=
 =?iso-8859-1?Q?6kI2gGJdKmF4oaJpje9GrrqY/oNbUiVTFdtwxW7NvD78P73+vrgUCFQsm8?=
 =?iso-8859-1?Q?sz3ajV1focE/JIL/orkI8K9raFV71XorUDMGE1QU30R6pqZVYNN50a2qw/?=
 =?iso-8859-1?Q?q3hLGvb9pxazRovcDT14UPYzwoBy81e+sig6UG4jV+C2wTHQ13OSOBcACv?=
 =?iso-8859-1?Q?dOdpv4Z6TweSBdti0afXZNmJ098Yz7Ax4bYzaKCc5nVUx7pClcmzLYWuFC?=
 =?iso-8859-1?Q?dQPPWlXK+T2K5cg6pFqPcOzYCFAqf4jvr0yytevHVVd+hqJcVRcFCjtgcH?=
 =?iso-8859-1?Q?70Fz8fIb0lU+Po20EmMWDbKVCxSg0Yh4S2679TlhMZEkKmzteSN3ji6qQ0?=
 =?iso-8859-1?Q?0B5J/yuqZA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R8O8m0k5DT1gc+LSnb/6JXvAi5ebr5ERSFLd77jIyj7inkqKEb6SByU3M248B4KbqRpp3t/tE7txOcmhJaCb+jpoRgYzXHq637DkTLiSyldanw2fv3T2PHY8GXF1T44jSOCfTheGaqvQffUcpPQeqtYE4aBqii6TJ4Hjt18ZA4kl8i1+t0A1xic9KDNN1yA0z59nscEgQUmk4hygq/jxXyTWgPxOmOV6PyRIFmRaZscAa3MSRRIgxDsGWp6YOkkLdnlDXYQ7/NHKpUAuTyPyWmkjNmcF0xXjd7OQW9xnPKpqvusBDHD7nNiY9tZasgmz3x2C/zlxn0leUChyRedIfubaqf5xmhws8z57tgWcEgN+yaOEzdD4cIDdrXMV2e9KWcuXzUwrs+cpNNAfsmhKvbPoxkYgk9Q0a7jOqrJHnWjo7Omnjuov5Cj11SKTtRVRXue2wrQMIIUdqSnpX3Vk70BtXOhHV9w/bluJeE6CRuSsWi5BXIg/8ioseILN0QNfnStSMYE5eK3OoddMS3AHrR+LMdbfbr6UU0aEnrq2T9/PRQHRpIiYlMq7LsyiLCtUK2P9gh4/klWpoywTxEz0QcuARzfnFLhw+f8XXgCQxS0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b10c1d8-25e8-4d1f-1d40-08de6a66a44b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:43:41.0306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmQkDp9RyeCuP6l6AzOJrXpSRZZTeCpRiWvEA50J7yamMjJ/yWq2jjPLjFaOH5Wqik8Vh2U6ebx5YRmbcpPqSEjhBeTZocpgPdzkJlz9lR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF07759F8B1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602120145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0NCBTYWx0ZWRfX4KQSE+fBfo2G
 Pwzd1tTgmK7byRrVlcCFEkKKBvQtu4Raucb6FL4EjgfeZ5jdrnUFp19tWO33181ShUSQcgyWV3B
 Fo/yD9H0AcDzmjmnwRCDudGj9INNDgYJ3xcjCdzB/XAVpbo4ZNEccLmlKzmjxTv6ChpG6bpfnW4
 Zd2/eU7NOPsHI5NaEpZFl5XqJEgYJvsCw/eeqoveS4DGAkYN4WOQ5mChAVPWQ52H3pEwhJplHDr
 r1DOrPzefd8InJ/FHqlxPMRWukuhLQxg/5xgmZVvD9ThDo3xEm/bA3zuk0rV4Luxk4JxiOyxZHH
 9NS6kxYTflU8/Mt0WKgfLRCW2DQrMF4OQWVGezGMlIvXyRakgS9BfIdW7rAJZVjFcRQP1EWrgQ+
 N6p5Xhe0J6VLiN+iJJsBUj7KSIr3FWVhleaLHjChyAfTrnrRf/Zg+RfB/XqrTfc3JPQne1vuF0y
 FTd6LsOhiwkK0GujQfA==
X-Proofpoint-GUID: QkQ8fGfXBvJDXHAH5XoeMxXrMYtLcGJV
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=698e1f63 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=64n8z8otlp8bWrbHBXkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: QkQ8fGfXBvJDXHAH5XoeMxXrMYtLcGJV

I believe the following on top of the original patch should resolve this:

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 9a692805..34349deb 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -487,16 +487,17 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
 		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
 			 pid);
 		goto out;
-	} else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
+	} else if (prf->prf_mapname == NULL ||
+		   (fn = Pmap_mapfile_name(P, mapp)) == NULL) {
 		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
 			 pid);
 		goto out;
 	}
-	mod = strrchr(fn, '/');
+	mod = strrchr(prf->prf_mapname, '/');
 	if (mod)
 		mod++;
 	else
-		mod = fn;


On Thu, Feb 12, 2026 at 01:37:06PM -0500, Kris Van Hees wrote:
> Oh, easy solution.... determine the mod name from prf->prf_mapname like we
> did before.  I.e. work with two filenames, one from prf->prf_mapname to get
> the module name, and one from Pmap_mapfile_name() to access the mapping data.
> 
> On Thu, Feb 12, 2026 at 01:28:08PM -0500, Kris Van Hees via DTrace-devel wrote:
> > Here is the problem:
> > 
> >         prf = mapp->pr_file;
> >         if (prf == NULL || (mapp = prf->first_segment) == NULL) { 
> >                 fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
> >                          pid);
> >                 goto out;
> >         } else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
> >                 fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
> >                          pid);
> >                 goto out;
> >         }
> >         mod = strrchr(fn, '/');
> >         if (mod)
> >                 mod++;
> >         else
> >                 mod = fn;
> > 
> > Since you changed this to get the mapping filename in map_files, you get a
> > name that has the address range as its filename, and since that gets used as
> > the module name, you end up with the wrong module name in the probe spec.
> > 
> > It needs to be the actual filename of the source file that the mapping came
> > from.
> > 
> > On Thu, Feb 12, 2026 at 06:18:25PM +0000, Nick Alcock wrote:
> > > On 12 Feb 2026, Eugene Loh outgrape:
> > > 
> > > > I do not know what went wrong here.  I would have bet big money that I
> > > > tested this, but here is what I find now with this patch:
> > > 
> > > So did I!
> > > 
> > > > test/unittest/usdt/tst.enabled.sh: Running timeout --signal=TERM 41 test/unittest/usdt/tst.enabled.sh /home/.../build/dtrace
> > > > FAIL: expected results differ.
> > > > 400000-401000:main:go
> > > >
> > > > Diff against expected:
> > > > --- test/unittest/usdt/tst.enabled.r    2026-02-12 05:31:24.000000000 +0000
> > > > +++ /tmp/runtest.6196/test.out  2026-02-12 18:09:58.980466976 +0000
> > > > @@ -1,2 +1,2 @@
> > > > -test:main:go
> > > > +400000-401000:main:go
> > > 
> > > This suggests that symbol lookup is failing, which it shouldn't be,
> > > because that *too* uses /proc/$pid/map_files, or should.
> > > 
> > > I clearly need to debug this. Got a system on which it goes wrong?
> > 
> > _______________________________________________
> > DTrace-devel mailing list
> > DTrace-devel@oss.oracle.com
> > https://oss.oracle.com/mailman/listinfo/dtrace-devel
